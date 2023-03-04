module aer_out #(
	parameter N = 256,
	parameter M = 8
)(
    // Global input ----------------------------------- 
    input  wire           CLK,
    input  wire           RST,
    
    // Inputs from SPI configuration latches ----------
    input  wire           SPI_GATE_ACTIVITY_sync,
    input  wire           SPI_OUT_AER_MONITOR_EN, //out aer monitor en
    input  wire [  M-1:0] SPI_MONITOR_NEUR_ADDR,  //monitor neu addr
    input  wire [  M-1:0] SPI_MONITOR_SYN_ADDR,   //monitor syn addr
    /*
    1.SPI_OUT_AER_MONITOR_EN - Enables automatic neuron and synapse state monitoring through the AER output link
        In its standard operation mode (i.e. SPI_OUT_AER_MONITOR_EN = 0,
            the output AER bus allows sending off-chip events that are generated locally by the neurons in the crossbar array. 
            When a neuron spikes, an output AER transaction is triggered and the 8-bit AEROUT_ADDR address field contains the 8-bit address of the spiking neuron.
        In the non-standard monitoring mode (i.e.  SPI_OUT_AER_MONITOR_EN =1), 
            the output AER bus allows monitoring state changes in a specific neuron and a specific synapse, whose addresses are defined in the configuration registers
             If the state of the monitored neuron changes, two successive AER transactions are triggered. 
             If the synaptic weight of the monitored synapse changes , one output AER transaction is triggered. 
             The output AER monitoring transactions are defined as follows.......
            
    2.SPI_MONITOR_NEUR_ADDR  - Neuron address to be monitored if SPI_OUT_AER_MONITOR_EN is asserted.
    3.SPI_MONITOR_SYN_ADDR   - Synapse address of the post-synaptic neuron SPI_MONITOR_NEUR_ADDR to be monitored if SPI_OUT_AER_MONITOR_EN is asserted.
    */
    input  wire           SPI_AER_SRC_CTRL_nNEUR, //aer src ctrl nNeur
    /*	Defines the source of the AER output events when a neuron spikes: 
    either directly from the neuron when the event is generated (0) or from the controller when the event is processed (1).
     This distinction is of importance especially if SPI_OPEN_LOOP is asserted.*/
    // Neuron data inputs -----------------------------
    input  wire [   14:0] NEUR_STATE_MONITOR,
    /*共15-bit{v_up_next， v_down_next，下一个Ca浓度的状态 state_calcium_next[2:0] ，00，SRAM的下一个膜电位状态 state_core_next[7:0] }*/
    input  wire [    6:0] NEUR_EVENT_OUT,
    /*如果激发了脉冲，那么是[1 000 000] */
    input  wire           CTRL_NEURMEM_WE,   //we 写使能
    input  wire [  M-1:0] CTRL_NEURMEM_ADDR, //addr
    input  wire           CTRL_NEURMEM_CS,   //cs 选择chip
    
    // Synapse data inputs ----------------------------
    input  wire [   31:0] SYNARRAY_WDATA,
    input  wire           CTRL_SYNARRAY_WE, 
    input  wire [   12:0] CTRL_SYNARRAY_ADDR,
    input  wire           CTRL_SYNARRAY_CS,
    
    // Input from scheduler ---------------------------
    input  wire [   12:0] SCHED_DATA_OUT,   //激发脉冲的原神经元的地址。
  
    // Input from controller --------------------------
    input  wire           CTRL_AEROUT_POP_NEUR,
    /* CTRL_AEROUT_POP_NEUR = (state == POP_NEUR) && (neur_cnt == SPI_MONITOR_NEUR_ADDR) && ctrl_cnt[0];*/
    
    // Output to controller ---------------------------
    (* mark_debug = "true" *)output reg            AEROUT_CTRL_BUSY,
    
	// Output 8-bit AER link --------------------------
	output reg  [  M-1:0] AEROUT_ADDR, 
	output reg  	      AEROUT_REQ,
	input  wire 	      AEROUT_ACK
);
   reg            AEROUT_ACK_sync_int, AEROUT_ACK_sync, AEROUT_ACK_sync_del; 
   wire           AEROUT_ACK_sync_negedge;
   
   reg  [    7:0] neuron_state_monitor_samp;
   reg  [    3:0] synapse_state_samp;
   wire [   31:0] synapse_state_int;
   wire           neuron_state_event, synapse_state_event, synapse_state_event_cond;
   reg            synapse_state_event_del;
   wire           monitored_neuron_popped;
   
   reg            do_neuron0_transfer, do_neuron1_transfer, do_synapse_transfer;
   
   wire           rst_activity;
   
   
   assign rst_activity = RST || SPI_GATE_ACTIVITY_sync;
   
   assign monitored_neuron_popped  = CTRL_AEROUT_POP_NEUR && (SCHED_DATA_OUT[M-1:0] == SPI_MONITOR_NEUR_ADDR);
   
   assign neuron_state_event       = SPI_OUT_AER_MONITOR_EN && ((CTRL_NEURMEM_CS  && CTRL_NEURMEM_WE  && (CTRL_NEURMEM_ADDR  == SPI_MONITOR_NEUR_ADDR))
                                                                 || (monitored_neuron_popped && SPI_AER_SRC_CTRL_nNEUR));
   assign synapse_state_event_cond = SPI_OUT_AER_MONITOR_EN &&   CTRL_SYNARRAY_CS && CTRL_SYNARRAY_WE && 
                                                                 (CTRL_SYNARRAY_ADDR == {SPI_MONITOR_SYN_ADDR, SPI_MONITOR_NEUR_ADDR[7:3]});
   assign synapse_state_event      = synapse_state_event_cond && !neuron_state_event;

   
   // Sync barrier
   always @(posedge CLK, posedge rst_activity) begin
		if (rst_activity) begin
			AEROUT_ACK_sync_int <= 1'b0;
			AEROUT_ACK_sync	    <= 1'b0;
			AEROUT_ACK_sync_del <= 1'b0;
		end
		else begin
			AEROUT_ACK_sync_int <= AEROUT_ACK;   // AEROUT_ACK 是外部输入信号
			AEROUT_ACK_sync	    <= AEROUT_ACK_sync_int;
			AEROUT_ACK_sync_del <= AEROUT_ACK_sync;
		end
	end
    assign AEROUT_ACK_sync_negedge = ~AEROUT_ACK_sync && AEROUT_ACK_sync_del;
    
    
    
    // Register state bank    
    always @(posedge CLK) begin
		if (neuron_state_event)
            neuron_state_monitor_samp <= NEUR_STATE_MONITOR[7:0];
            /*共15-bit{v_up_next， v_down_next，下一个Ca浓度的状态 state_calcium_next[2:0] ，00，SRAM的下一个膜电位状态 state_core_next[7:0] }*/
        else
            neuron_state_monitor_samp <= neuron_state_monitor_samp;
	end
    always @(posedge CLK) begin
		if (synapse_state_event_cond)
            synapse_state_samp <= synapse_state_int[3:0];
        else
            synapse_state_samp <= synapse_state_samp;
	end
    
    assign synapse_state_int = SYNARRAY_WDATA >> ({2'b0,SPI_MONITOR_NEUR_ADDR[2:0]} << 2);
    
    
    // Output AER interface
    always @(posedge CLK, posedge rst_activity) begin
		if (rst_activity) begin
			AEROUT_ADDR             <= 8'b0;
			AEROUT_REQ              <= 1'b0;
            AEROUT_CTRL_BUSY        <= 1'b0;
            do_neuron0_transfer     <= 1'b0;
            do_neuron1_transfer     <= 1'b0;
            do_synapse_transfer     <= 1'b0;
            synapse_state_event_del <= 1'b0;
		end else if (~SPI_OUT_AER_MONITOR_EN) begin  // SPI_OUT_AER_MONITOR_EN==0
		/*SPI_OUT_AER_MONITOR_EN==0：
             the output AER bus allows sending off-chip events that are generated locally by the neurons in the crossbar array. 
             When a neuron spikes, an output AER transaction is triggered and the 8-bit AEROUT_ADDR address field contains the 8-bit address 
             of the spiking neuron.
             输出AER总线允许发送由交叉杆阵列中的神经元本地生成的片外事件。
            当神经元出现峰值时，将触发输出AER事务，8位AEROUT_ADDR地址字段包含峰值神经元的8位地址。
		*/
            do_neuron0_transfer     <= 1'b0;
            do_neuron1_transfer     <= 1'b0;
            do_synapse_transfer     <= 1'b0;
            synapse_state_event_del <= 1'b0;
            //if ((SPI_AER_SRC_CTRL_nNEUR ? CTRL_AEROUT_POP_NEUR : NEUR_EVENT_OUT[6]) && ~AEROUT_ACK_sync) begin
            //  AEROUT_ADDR      <= SPI_AER_SRC_CTRL_nNEUR ? SCHED_DATA_OUT[M-1:0] : CTRL_NEURMEM_ADDR;
            //SPI_AER_SRC_CTRL_nNEUR 这个寄存器的值要配置为0 ， NEUR_EVENT_OUT[6] && ~AEROUT_ACK_sync
            if (NEUR_EVENT_OUT[6] && ~AEROUT_ACK_sync) begin
                AEROUT_ADDR      <= CTRL_NEURMEM_ADDR;
                AEROUT_REQ       <= 1'b1;
                AEROUT_CTRL_BUSY <= 1'b1;
            end else if (AEROUT_ACK_sync) begin
                AEROUT_ADDR      <= AEROUT_ADDR;
                AEROUT_REQ       <= 1'b0;
                AEROUT_CTRL_BUSY <= 1'b1;
            end else if (AEROUT_ACK_sync_negedge) begin
                AEROUT_ADDR      <= AEROUT_ADDR;
                AEROUT_REQ       <= 1'b0;
                AEROUT_CTRL_BUSY <= 1'b0;
            end else begin
                AEROUT_ADDR      <= AEROUT_ADDR;
                AEROUT_REQ       <= AEROUT_REQ;
                AEROUT_CTRL_BUSY <= AEROUT_CTRL_BUSY;
            end
        end else begin  
        //SPI_OUT_AER_MONITOR_EN==1
            if (AEROUT_ACK_sync_negedge) begin
                AEROUT_ADDR             <= AEROUT_ADDR;
                AEROUT_REQ              <= 1'b0;
                AEROUT_CTRL_BUSY        <= do_neuron0_transfer || synapse_state_event_del;
                do_neuron0_transfer     <= 1'b0;
                do_neuron1_transfer     <= do_neuron0_transfer;
                do_synapse_transfer     <= 1'b0;
                synapse_state_event_del <= synapse_state_event_del;
            end else if (AEROUT_ACK_sync) begin
                AEROUT_ADDR             <= AEROUT_ADDR;
                AEROUT_REQ              <= 1'b0;
                AEROUT_CTRL_BUSY        <= 1'b1;
                do_neuron0_transfer     <= do_neuron0_transfer;
                do_neuron1_transfer     <= do_neuron1_transfer;
                do_synapse_transfer     <= do_synapse_transfer;
                synapse_state_event_del <= synapse_state_event_del;
            end else if ((neuron_state_event || synapse_state_event) && !AEROUT_REQ) begin
                AEROUT_ADDR             <= synapse_state_event ? {4'b1111,synapse_state_int[3:0]}
                                                               : {(SPI_AER_SRC_CTRL_nNEUR ? monitored_neuron_popped : NEUR_EVENT_OUT[6]),NEUR_STATE_MONITOR[14:8]};
                AEROUT_REQ              <= 1'b1;
                AEROUT_CTRL_BUSY        <= 1'b1;
                do_neuron0_transfer     <= neuron_state_event;
                do_neuron1_transfer     <= 1'b0;
                do_synapse_transfer     <= synapse_state_event;
                synapse_state_event_del <= synapse_state_event_cond && neuron_state_event;
            end else if (do_neuron1_transfer && !AEROUT_REQ) begin
                AEROUT_ADDR             <= neuron_state_monitor_samp;
                AEROUT_REQ              <= 1'b1;
                AEROUT_CTRL_BUSY        <= 1'b1;
                do_neuron0_transfer     <= 1'b0;
                do_neuron1_transfer     <= 1'b1;
                do_synapse_transfer     <= 1'b0;
                synapse_state_event_del <= synapse_state_event_del;
            end else if (synapse_state_event_del && !AEROUT_REQ) begin
                AEROUT_ADDR             <= {4'b1111,synapse_state_samp};
                AEROUT_REQ              <= 1'b1;
                AEROUT_CTRL_BUSY        <= 1'b1;
                do_neuron0_transfer     <= 1'b0;
                do_neuron1_transfer     <= 1'b0;
                do_synapse_transfer     <= 1'b0;
                synapse_state_event_del <= 1'b0;
            end else begin
                AEROUT_ADDR             <= AEROUT_ADDR;
                AEROUT_REQ              <= AEROUT_REQ;
                AEROUT_CTRL_BUSY        <= AEROUT_CTRL_BUSY;
                do_neuron0_transfer     <= do_neuron0_transfer;
                do_neuron1_transfer     <= do_neuron1_transfer;
                do_synapse_transfer     <= do_synapse_transfer;
                synapse_state_event_del <= synapse_state_event_del;
            end
        end
	end
endmodule 
