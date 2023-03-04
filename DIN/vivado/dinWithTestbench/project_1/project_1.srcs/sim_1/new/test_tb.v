 `timescale 1ns / 1ns
module test_tb ();
	parameter N = 256;
	parameter M = 8;
    // Global input     -------------------------------
    reg    CLK;
    reg    RST;
    
    // SPI slave        -------------------------------
    reg      SCK;
//    reg      MOSI;
        wire      MOSI;
    wire      MISO;

	// Input 16-bit AER -------------------------------
//	reg [ 16:0] AERIN_ADDR;  //[16:0]
	wire [ 16:0] AERIN_ADDR;  //[16:0]
	reg         AERIN_REQ;
	wire 		  AERIN_ACK;

	// Output 8-bit AER -------------------------------
	wire [ 7:0] AEROUT_ADDR;  //[7:0]
	wire 	     AEROUT_REQ;
	reg          AEROUT_ACK;
	

//信号初始化
//产生时钟
parameter ClockPerilod=10 ;
initial
	begin
		CLK=0;
		forever begin
		#(ClockPerilod/2) CLK = ~CLK; 
		end
	end
initial
	begin
		SCK=0;
		forever begin
		#(ClockPerilod*2) SCK = ~SCK; 
		end
	end	

initial 
    begin
    RST = 1'b1;
    AERIN_REQ = 0;

    #10;
    RST = 1'b0;

    end

	
 //需要完成SPI的配置 
 reg [12:0]    counter ;
initial 
    begin
    counter = 12'b0 ; 
    #40;
        repeat(1040)begin
        counter = counter + 1'b1;
        #(ClockPerilod*4);
        end
    end
    
  SPI_mem_gen_0  SPI_ROM( 
    .a(counter),
    .spo(MOSI)
    );

//需要完成AER_IN的数据
 reg [10:0] counter2;
initial 
    begin
    #40;
    #(ClockPerilod*4*1040);
    AERIN_REQ = 1;
    AEROUT_ACK = 1'b0;
    counter2=0;
//    forever
//        begin
//        #(ClockPerilod*4);
//        AERIN_REQ =~AERIN_REQ;
//        if(counter2==1600)
//        counter2=0;
//        else counter2=counter2+1;
//        end
end    
always@(posedge AERIN_ACK)
        begin
        AERIN_REQ = 0;
        if(counter2==1600)
        counter2=0;
        else counter2=counter2+1;
        end
always@(negedge AERIN_ACK)
        AERIN_REQ = 1;

   AER_mem_gen_0  AER_IN_ROM(
    .a(counter2),
    .spo(AERIN_ADDR)
    );
    
    
//AER_OUT的配置
always@(posedge AEROUT_REQ)

    AEROUT_ACK = 1;
//    #(ClockPerilod*4)
always@(negedge AEROUT_REQ)
    AEROUT_ACK = 0;


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
	. AEROUT_ACK(AEROUT_ACK)
    );
    
       
    
    
endmodule
