//------------------------------------------------------------------------------
//
// "fifo.v" - ODIN scheduler FIFO module
// 
// Project: ODIN - An online-learning digital spiking neuromorphic processor
//
// Author:  C. Frenkel, Universit茅 catholique de Louvain (UCLouvain), 04/2017
//
// Cite/paper: C. Frenkel, M. Lefebvre, J.-D. Legat and D. Bol, "A 0.086-mm虏 12.7-pJ/SOP 64k-Synapse 256-Neuron Online-Learning
//             Digital Spiking Neuromorphic Processor in 28-nm CMOS," IEEE Transactions on Biomedical Circuits and Systems,
//             vol. 13, no. 1, pp. 145-158, 2019.
//------------------------------------------------------------------------------
module fifo #(//13 32 5
	/*parameter width      = 13,
    parameter depth      = 32,
    parameter depth_addr = 5*/
	parameter width      = 9,
    parameter depth      = 4,
    parameter depth_addr = 2
)(
    input  wire              clk,
    input  wire              rst_n,
    input  wire              push_req_n,
    input  wire              pop_req_n,
    input  wire [width-1: 0] data_in,  
    output reg               empty,
    output wire              full,
    output wire [width-1: 0] data_out
    /*  .push_req_n(full_main | push_req_n),
        .pop_req_n(empty_main | ~empty_burst | CTRL_SCHED_POP_N),
        .data_in(CTRL_SCHED_EVENT_IN[6] ? {CTRL_SCHED_VIRTS,CTRL_SCHED_ADDR} : {5'b0,CTRL_NEURMEM_ADDR}),
        .empty(empty_main),
        .full(full_main),
        .data_out(data_out_main) 
     先看懂接口传入的参数的含义，再仔细分析下面的代码
         */
);
  
    reg [width-1:0] mem [0:depth-1];  //[12:0][0:31]  第一维度是32个，第二维度是13个

    reg [depth_addr-1:0] write_ptr; //[4:0]
    reg [depth_addr-1:0] read_ptr;
    reg [depth_addr-1:0] fill_cnt; // [4:0]

    genvar i;
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n)
            write_ptr <= 2'b0;
        else if (!push_req_n)  //push_req_n是低电平的时候，写指针write_ptr会自增。
            write_ptr <= write_ptr + {{(depth_addr-1){1'b0}},1'b1};
        else                   //push_req_n==1 -> 
            write_ptr <= write_ptr;
    end

    always @(posedge clk, negedge rst_n) begin
        if (!rst_n)
            read_ptr <= 2'b0;
        else if (!pop_req_n)  //pop_req_n是低电平的时候，读指针会自增。
            read_ptr <= read_ptr + {{(depth_addr-1){1'b0}},1'b1};
        else                  //pop_req_n==1 ->
            read_ptr <= read_ptr;
    end

    always @(posedge clk, negedge rst_n) begin
        if (!rst_n)
            fill_cnt <= 2'b0;
        else if (!push_req_n && pop_req_n && !empty)
        //只写不读，且fifo不空(i.e.push=0,pop=1,empty=0)时, write_ptr++  read_ptr不变  fill_cnt++   empty=0
            fill_cnt <= fill_cnt + {{(depth_addr-1){1'b0}},1'b1};        
        else if (!push_req_n && !pop_req_n)         
        //边写边读(i.e.push=0,pop=0)                    时, write_ptr++  read_ptr++   fill_cnt不变  empty<= ~|fill_cnt;
            fill_cnt <= fill_cnt;   
        else if (!pop_req_n && |fill_cnt)           
        //只读不写(i.e. pop=0,fill_cnt!=0)              时,             read_ptr++    fill_cnt--    empty<= ~|fill_cnt;
            fill_cnt <= fill_cnt - {{(depth_addr-1){1'b0}},1'b1};
        else
            fill_cnt <= fill_cnt;
    end

    always @(posedge clk, negedge rst_n) begin
        if (!rst_n)
            empty <= 1'b1;
        else if (!push_req_n)  //push_req_n=0  时 empty=0
            empty <= 1'b0;
        else if (!pop_req_n)   //pop_req_n=0  时  empty=~|fill_cnt;
            empty <= ~|fill_cnt;
            //如果只读不写，那么当fill_cnt=00000，再读就下标越界，所以empty=1，表示fifo已空
            //然后将empty返回再次作为输入信号，使得pop=1，也就控制这程序不能再读，即read_ptr不能+1
    end

    assign full  =  &fill_cnt;  //当fill_cnt=2^depth_addr时fifo中存满了数据，full=1
    
    generate
        for (i=0; i<depth; i=i+1) begin
            /*  parameter width = 13,parameter depth = 32,parameter depth_addr = 5   说明可以存放32个位宽为13-bit 的数据,fifo大小为32*13 */
            /*	parameter width = 9 ,parameter depth = 4, parameter depth_addr = 2   说明可以存放4个位宽为9-bit 的数据,fifo大小为4*9 */
            always @(posedge clk) begin
                if (!push_req_n && (write_ptr == i)) //push_req_n=0时： write_ptr++ ， empty=0
                    mem[i] <= data_in; //当data_in 位宽位9时，其中8-bit用来存放激发脉冲的原神经元的地址，因此输出的数据也是。
                else 
                    mem[i] <= mem[i];
            end
        end
    endgenerate

    assign data_out = mem[read_ptr]; //read_ptr可以当作fifo深度的索引

endmodule 
