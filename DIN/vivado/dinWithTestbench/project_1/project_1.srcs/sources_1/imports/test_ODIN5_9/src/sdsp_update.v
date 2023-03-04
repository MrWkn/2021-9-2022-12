module sdsp_update #(
    parameter WIDTH = 3
)(
    // Inputs
        // General
    input  wire             SYN_PRE,                         //使能
    input  wire             SYN_BIST_REF,                    //双稳态事件使能 
        // From neuron
    input  wire             V_UP,
    input  wire             V_DOWN,    
        // From SRAM
    input  wire [WIDTH:0] WSYN_CURR,
	// Output
	output reg  [WIDTH:0] WSYN_NEW
);
    wire w_lt_half;
    wire do_up, do_down;
    wire overflow;
    assign w_lt_half = SYN_PRE & ~WSYN_CURR[WIDTH-1];                 // if >一半，w_lt_half=0 ，反之=1
    assign do_up     = SYN_PRE & (SYN_BIST_REF ? ~w_lt_half : V_UP);  
    assign do_down   = SYN_PRE & (SYN_BIST_REF ?  w_lt_half : V_DOWN);
    //双稳态事件 SYN_BIST_REF = 1   该事件更新权重  不涉及任何一个神经元
    assign overflow  = SYN_PRE & ((do_up && (&WSYN_CURR[WIDTH-1:0])) || (do_down && (~|WSYN_CURR[WIDTH-1:0]))); 
	always @(*) begin
		if      (overflow) WSYN_NEW = WSYN_CURR;
		else if (do_up)    WSYN_NEW = WSYN_CURR + {{(WIDTH){1'b0}},1'b1};
		else if (do_down)  WSYN_NEW = WSYN_CURR - {{(WIDTH){1'b0}},1'b1};
		else               WSYN_NEW = WSYN_CURR;
	end 
endmodule
/*
不同事件输入后，突触权重如何被更新？  无论哪种事件，权重每次只会变化1
1.脉冲事件：
    根据神经元中的SDSP的条件，判断do_up和do_down信号 ，传给突触模块，更新突触权重 
2.双稳态事件参考事件：
    和神经元没有关系，单纯的根据权重是否超过θw  来更新权重。因此可能会形成LTP 长时程增强效应
3.时间参考时间：  
    根据神经元中的SDSP的条件，判断do_up和do_down信号 ，传给突触模块，更新突触权重 
*/