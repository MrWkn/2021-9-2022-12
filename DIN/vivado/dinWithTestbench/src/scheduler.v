// 
//------------------------------------------------------------------------------

 
module scheduler #(
    parameter                   prio_num = 57,        // 7*8+1=57,8 spikes with an ISI of up 7timesteps.
    parameter                   N = 256,
    parameter                   M = 8
)( 

    // Global inputs ------------------------------------------
    input  wire                 CLK,
    input  wire                 RSTN,
    
    // Inputs from controller ---------------------------------
    input  wire                 CTRL_SCHED_POP_N,
    /*
    if (state == POP_NEUR)
    CTRL_SCHED_POP_N  = ~&ctrl_cnt[8:0]; //当 ctrl_cnt[8:0]=511时，CTRL_SCHED_POP_N=0；否则=1。
    if (state == POP_VIRT)
        if (ctrl_cnt == 0)     CTRL_SCHED_POP_N = 1'b1;  CTRL_NEURMEM_WE  = 1'b0; 
        else                   CTRL_SCHED_POP_N = 1'b0;  CTRL_NEURMEM_WE  = 1'b1;
    */
	
    input  wire [          4:0] CTRL_SCHED_VIRTS,  //AERIN_ADDR[7:3]
    /*
    if (state == PUSH)
        CTRL_SCHED_VIRTS = AERIN_ADDR[M-1:M-5];    [7:3]  
        Stimulates a specific neuron with weight w<2:0> and sign bit s (1: inhibitory, 0: excitatory), 
        If the leak bit l is asserted, weight information is ignored and a time reference / leakage event is triggered in the neuron instead. 
        Virtual events go through the scheduler(1 cycle for a push to the scheduler, 2 cycles for processing when the event is popped from the scheduler).
    */ 
	
    input  wire [          7:0] CTRL_SCHED_ADDR,
    input  wire [          6:0] CTRL_SCHED_EVENT_IN,
    
    // Inputs from neurons ------------------------------------
    input  wire [        M-1:0] CTRL_NEURMEM_ADDR,
    input  wire [          6:0] NEUR_EVENT_OUT,
    
    // Inputs from SPI configuration registers ----------------
    input  wire                 SPI_OPEN_LOOP,
    input  wire [         19:0] SPI_BURST_TIMEREF,
    
    // Outputs ------------------------------------------------
    output wire                 SCHED_EMPTY,
    output wire                 SCHED_FULL,
    output wire                 SCHED_BURST_END,
    output wire [         12:0] SCHED_DATA_OUT
);


    wire                   spike_in;
    wire [            2:0] spk_ref;
    wire [            3:0] isi_shift;
     
    reg  [  prio_num- 1:0] push_req_burst_n;
    reg                    push_req_n;
    reg  [  prio_num- 1:0] last_spk_in_burst;

    reg  [            7:0] priority; 
    reg  [           19:0] priority_cnt;
    wire                   rst_priority;

    wire [  prio_num- 1:0] push_req_burst_n_fifo;
    wire [  prio_num- 1:0] last_spk_in_burst_fifo;
    wire [  prio_num- 1:0] empty_burst_fifo;
    wire [  prio_num- 1:0] full_burst_fifo;
    wire [9*prio_num- 1:0] data_out_fifo;
    wire                   last_spk_in_burst_int;

    wire                   empty_main;
    wire                   full_main;
    wire [           12:0] data_out_main;
    wire [  prio_num- 2:0] empty_burst_dummy;
    wire [  prio_num- 2:0] full_burst_dummy;
    wire [9*prio_num-10:0] data_out_burst_dummy;
    wire                   empty_burst;
    wire                   full_burst;
    wire [            7:0] data_out_burst;

    reg                    SPI_OPEN_LOOP_sync_int, SPI_OPEN_LOOP_sync;

    wire                   timestamp_next;

    genvar i;


    // Sync barrier from SPI

    always @(posedge CLK, negedge RSTN) begin
        if(~RSTN) begin
            SPI_OPEN_LOOP_sync_int  <= 1'b0;
            SPI_OPEN_LOOP_sync	    <= 1'b0;
        end
        else begin
            SPI_OPEN_LOOP_sync_int  <= SPI_OPEN_LOOP;
            SPI_OPEN_LOOP_sync	    <= SPI_OPEN_LOOP_sync_int;
        end
    end

    // Splitting event_out into FIFO push commands

    assign spike_in  = (~SPI_OPEN_LOOP_sync & NEUR_EVENT_OUT[6]) | CTRL_SCHED_EVENT_IN[6];
	//state == PUSH 时， CTRL_SCHED_EVENT_IN = 7'h40 (i.e.1000000),其他状态下 CTRL_SCHED_EVENT_IN=0.
    /* ~SPI_OPEN_LOOP_sync 表示不使用SPI传输数据；NEUR_EVENT_OUT[6] =1 表示神经元激发了脉冲
        NEUR_EVENT_OUT =IZH_neuron_event_out。如果选择了Izhikevich模型，NEUR_EVENT_OUT={spike_out, param_spk_ref, param_isi_ref} 1-bit 3-bit 3-bit
    */
	
    assign spk_ref   = CTRL_SCHED_EVENT_IN[6] ? CTRL_SCHED_EVENT_IN[5:3] : NEUR_EVENT_OUT[5:3];
	// 对于LIF模型 ，NEUR_EVENT_OUT[5:0] ； 即 这俩值都是0。
    assign isi_shift = CTRL_SCHED_EVENT_IN[6] ? ({1'b0, CTRL_SCHED_EVENT_IN[2:0]} + 4'b1) : ({1'b0, NEUR_EVENT_OUT[2:0]} + 4'b1);

    always @(*) begin

        if (spike_in) begin
            if ((spk_ref == 3'd0) || rst_priority) begin
                push_req_burst_n  = {prio_num{1'b1}};
                push_req_n        = 1'b0;
                last_spk_in_burst = {prio_num{1'b0}};
            end else begin 
			
			// 对于 LIF   push_req_burst_n=~57'b1 ;     last_spk_in_burst=0；
                push_req_burst_n  = ~(
                                      ({{(prio_num-1){1'b0}},1'b1}            << ( isi_shift   ) ) |
                                      ({{(prio_num-1){1'b0}},(spk_ref>=3'd2)} << ((isi_shift*2)) ) |
                                      ({{(prio_num-1){1'b0}},(spk_ref>=3'd3)} << ((isi_shift*3)) ) |
                                      ({{(prio_num-1){1'b0}},(spk_ref>=3'd4)} << ((isi_shift*4)) ) |
                                      ({{(prio_num-1){1'b0}},(spk_ref>=3'd5)} << ((isi_shift*5)) ) |
                                      ({{(prio_num-1){1'b0}},(spk_ref>=3'd6)} << ((isi_shift*6)) ) |
                                      ({{(prio_num-1){1'b0}},(spk_ref==3'd7)} << ((isi_shift*7)) ) );
                push_req_n        = 1'b0;
                last_spk_in_burst =  (                                                                     
                                      ({{(prio_num-1){1'b0}},(spk_ref==3'd1)} << ( isi_shift   ) ) |
                                      ({{(prio_num-1){1'b0}},(spk_ref==3'd2)} << ((isi_shift*2)) ) |
                                      ({{(prio_num-1){1'b0}},(spk_ref==3'd3)} << ((isi_shift*3)) ) |
                                      ({{(prio_num-1){1'b0}},(spk_ref==3'd4)} << ((isi_shift*4)) ) |
                                      ({{(prio_num-1){1'b0}},(spk_ref==3'd5)} << ((isi_shift*5)) ) |
                                      ({{(prio_num-1){1'b0}},(spk_ref==3'd6)} << ((isi_shift*6)) ) |
                                      ({{(prio_num-1){1'b0}},(spk_ref==3'd7)} << ((isi_shift*7)) ) );
            end
        end else begin
            push_req_burst_n  = {prio_num{1'b1}};
            push_req_n        = 1'b1;
            last_spk_in_burst = {prio_num{1'b0}};
        end
    end


    // Priority

    always @(posedge CLK, posedge rst_priority) begin

        if (rst_priority)
            priority_cnt <= 20'b0;
        else
            if (timestamp_next)
                priority_cnt <= 20'b0;
            else 
                priority_cnt <= priority_cnt + 20'b1;

    end

    assign timestamp_next = (priority_cnt == SPI_BURST_TIMEREF);

    always @(posedge CLK, posedge rst_priority) begin

        if (rst_priority)
            priority <= 8'b0;
        else
            if (timestamp_next)
                if (priority == (prio_num - 1))
                    priority <= 8'b0;
                else 
                    priority <= priority + 8'b1;
            else
                priority  <= priority;

    end

    assign rst_priority = ~RSTN || SPI_OPEN_LOOP_sync || (~|SPI_BURST_TIMEREF);


    // FIFO instances

    fifo #(
        .width(13),
        .depth(32),
        .depth_addr(5)
    ) fifo_spike_0 (
        .clk(CLK),
        .rst_n(RSTN),
        .push_req_n(full_main | push_req_n),
        .pop_req_n(empty_main | ~empty_burst | CTRL_SCHED_POP_N),                   //低电平使能 CTRL_SCHED_POP_N 也是0的时候使能
        .data_in(CTRL_SCHED_EVENT_IN[6] ? {CTRL_SCHED_VIRTS,CTRL_SCHED_ADDR} : {5'b0,CTRL_NEURMEM_ADDR}),
        .empty(empty_main),
        .full(full_main),
        .data_out(data_out_main)
    );

    generate

        for (i=0; i<prio_num; i=i+1) begin
        
            fifo #(
                .width(9),
                .depth(4),
                .depth_addr(5)
            ) fifo_burst (
                .clk(CLK),
                .rst_n(~rst_priority),
                .push_req_n(full_burst_fifo[i] | push_req_burst_n_fifo[i]),//~(~full_burst_fifo[i] & push_req_burst_n_fifo[i])),
                .pop_req_n(~(~empty_burst_fifo[i] & (i == priority)) | CTRL_SCHED_POP_N),
                .data_in({last_spk_in_burst_fifo[i],CTRL_NEURMEM_ADDR}),
                .empty(empty_burst_fifo[i]), 
                .full(full_burst_fifo[i]),
                .data_out(data_out_fifo[9*i+8:9*i])
            );
                  
        end
        
    endgenerate

    assign push_req_burst_n_fifo  = (push_req_burst_n  << priority) | (push_req_burst_n  >> (prio_num - priority));
    assign last_spk_in_burst_fifo = (last_spk_in_burst << priority) | (last_spk_in_burst >> (prio_num - priority));  


    // Output selection

    assign {empty_burst_dummy,empty_burst}                             = empty_burst_fifo >> priority;
    assign {full_burst_dummy,full_burst}                               = full_burst_fifo >> priority;
    assign {data_out_burst_dummy,last_spk_in_burst_int,data_out_burst} = data_out_fifo >> (9*priority);

    assign SCHED_DATA_OUT                                              = empty_burst ? data_out_main : {5'b0,data_out_burst};
	//empty_burst 可以判断单个脉冲还是多个脉冲！  如果是单个SCHED_DATA_OUT=data_out_main，如果是多个SCHED_DATA_OUT={5'b0,data_out_burst}
    //其中存储激发脉冲的原神经元的地址。
    assign SCHED_BURST_END                                             = empty_burst ? 1'b0 : last_spk_in_burst_int;
    assign SCHED_EMPTY                                                 = empty_main && empty_burst;
    assign SCHED_FULL                                                  = full_main;



endmodule
