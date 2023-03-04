`timescale 1ns / 1ps
module SYSTEM_TOP#(
	parameter N = 256,
	parameter M = 8
	)(
    input  wire           CLK,
    input  wire           RST,
    
    input  wire           SCK,
    (* mark_debug = "true" *)input  wire           MOSI,
    (* mark_debug = "true" *)output  wire          MISO,
    input wire [  2*M:0] AERIN_ADDR,  //[16:0]
	input wire           AERIN_REQ,
	output wire 		 AERIN_ACK,
	
    (* mark_debug = "true" *)output wire 	        AEROUT_REQ,
    (* mark_debug = "true" *)output wire [  M-1:0] AEROUT_ADDR,
	(* mark_debug = "true" *)input  wire 	        AEROUT_ACK,
	
    output wire           SCHED_FULL,
	output wire [6:0]     NEUR_EVENT_OUT,
	output wire CTRL_SCHED_POP_N,
	output wire AEROUT_CTRL_BUSY,
	output wire CTRL_NEURMEM_ADDR
	);



/*
MOSI 如果加上下面这段代码，将会产生两个驱动，一个来自sdk，另一个来自下面：
*/
//// 完成 SPI 的配置 
// reg [10:0]    counter_SPI ;
// reg SPI_MEM_CE;
//always@(posedge SCK)
//    if(RST) begin
//        counter_SPI = 0;
//        SPI_MEM_CE=1;
//        end
//    else if (counter_SPI == 1040) begin
//        counter_SPI=counter_SPI;
//        SPI_MEM_CE = 0;
//        end
//    else counter_SPI=counter_SPI+1;
    
//  SPI_mem_gen_0  SPI_ROM( 
//    .a(counter_SPI),
//    .qspo_ce(),
//    .spo(MOSI)
//    );


//例化模块
 ODIN #(
	 .N(N),
	 .M(M)
) ODIN_test (
    // Global input     -------------------------------
    . CLK(CLK),
    . RST(RST),
    
    // SPI slave        -------------------------------
    . SCK(SCK),
    . MOSI(MOSI),
    . MISO(MISO),

	// Input 16-bit AER -------------------------------
	. AERIN_ADDR(AERIN_ADDR),  //[16:0]
	. AERIN_REQ(AERIN_REQ),
	. AERIN_ACK(AERIN_ACK),

	// Output 8-bit AER -------------------------------
	. AEROUT_ADDR(AEROUT_ADDR),  //[7:0]
	. AEROUT_REQ(AEROUT_REQ),
	. AEROUT_ACK(AEROUT_ACK),
	.SCHED_FULL(SCHED_FULL),
	.NEUR_EVENT_OUT(NEUR_EVENT_OUT),
	.CTRL_SCHED_POP_N(CTRL_SCHED_POP_N),
	.AEROUT_CTRL_BUSY(AEROUT_CTRL_BUSY),
	.CTRL_NEURMEM_ADDR(CTRL_NEURMEM_ADDR)
    );

endmodule
