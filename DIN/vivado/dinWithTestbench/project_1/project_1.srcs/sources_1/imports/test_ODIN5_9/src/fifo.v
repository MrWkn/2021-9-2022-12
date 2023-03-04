//------------------------------------------------------------------------------
//
// "fifo.v" - ODIN scheduler FIFO module
// 
// Project: ODIN - An online-learning digital spiking neuromorphic processor
//
// Author:  C. Frenkel, Université catholique de Louvain (UCLouvain), 04/2017
//
// Cite/paper: C. Frenkel, M. Lefebvre, J.-D. Legat and D. Bol, "A 0.086-mm² 12.7-pJ/SOP 64k-Synapse 256-Neuron Online-Learning
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
     �ȿ����ӿڴ���Ĳ����ĺ��壬����ϸ��������Ĵ���
         */
);
  
    reg [width-1:0] mem [0:depth-1];  //[12:0][0:31]  ��һά����32�����ڶ�ά����13��

    reg [depth_addr-1:0] write_ptr; //[4:0]
    reg [depth_addr-1:0] read_ptr;
    reg [depth_addr-1:0] fill_cnt; // [4:0]

    genvar i;
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n)
            write_ptr <= 2'b0;
        else if (!push_req_n)  //push_req_n�ǵ͵�ƽ��ʱ��дָ��write_ptr��������
            write_ptr <= write_ptr + {{(depth_addr-1){1'b0}},1'b1};
        else                   //push_req_n==1 -> 
            write_ptr <= write_ptr;
    end

    always @(posedge clk, negedge rst_n) begin
        if (!rst_n)
            read_ptr <= 2'b0;
        else if (!pop_req_n)  //pop_req_n�ǵ͵�ƽ��ʱ�򣬶�ָ���������
            read_ptr <= read_ptr + {{(depth_addr-1){1'b0}},1'b1};
        else                  //pop_req_n==1 ->
            read_ptr <= read_ptr;
    end

    always @(posedge clk, negedge rst_n) begin
        if (!rst_n)
            fill_cnt <= 2'b0;
        else if (!push_req_n && pop_req_n && !empty)
        //ֻд��������fifo����(i.e.push=0,pop=1,empty=0)ʱ, write_ptr++  read_ptr����  fill_cnt++   empty=0
            fill_cnt <= fill_cnt + {{(depth_addr-1){1'b0}},1'b1};        
        else if (!push_req_n && !pop_req_n)         
        //��д�߶�(i.e.push=0,pop=0)                    ʱ, write_ptr++  read_ptr++   fill_cnt����  empty<= ~|fill_cnt;
            fill_cnt <= fill_cnt;   
        else if (!pop_req_n && |fill_cnt)           
        //ֻ����д(i.e. pop=0,fill_cnt!=0)              ʱ,             read_ptr++    fill_cnt--    empty<= ~|fill_cnt;
            fill_cnt <= fill_cnt - {{(depth_addr-1){1'b0}},1'b1};
        else
            fill_cnt <= fill_cnt;
    end

    always @(posedge clk, negedge rst_n) begin
        if (!rst_n)
            empty <= 1'b1;
        else if (!push_req_n)  //push_req_n=0  ʱ empty=0
            empty <= 1'b0;
        else if (!pop_req_n)   //pop_req_n=0  ʱ  empty=~|fill_cnt;
            empty <= ~|fill_cnt;
            //���ֻ����д����ô��fill_cnt=00000���ٶ����±�Խ�磬����empty=1����ʾfifo�ѿ�
            //Ȼ��empty�����ٴ���Ϊ�����źţ�ʹ��pop=1��Ҳ�Ϳ�����������ٶ�����read_ptr����+1
    end

    assign full  =  &fill_cnt;  //��fill_cnt=2^depth_addrʱfifo�д��������ݣ�full=1
    
    generate
        for (i=0; i<depth; i=i+1) begin
            /*  parameter width = 13,parameter depth = 32,parameter depth_addr = 5   ˵�����Դ��32��λ��Ϊ13-bit ������,fifo��СΪ32*13 */
            /*	parameter width = 9 ,parameter depth = 4, parameter depth_addr = 2   ˵�����Դ��4��λ��Ϊ9-bit ������,fifo��СΪ4*9 */
            always @(posedge clk) begin
                if (!push_req_n && (write_ptr == i)) //push_req_n=0ʱ�� write_ptr++ �� empty=0
                    mem[i] <= data_in; //��data_in λ��λ9ʱ������8-bit������ż��������ԭ��Ԫ�ĵ�ַ��������������Ҳ�ǡ�
                else 
                    mem[i] <= mem[i];
            end
        end
    endgenerate

    assign data_out = mem[read_ptr]; //read_ptr���Ե���fifo��ȵ�����

endmodule 
