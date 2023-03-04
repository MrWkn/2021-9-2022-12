// 
//------------------------------------------------------------------------------


module sdsp_update #(
    parameter WIDTH = 3
)(
    // Inputs
        // General
    input  wire             SYN_PRE,                         //ʹ��
    input  wire             SYN_BIST_REF,                    //˫��̬�¼�ʹ�� 
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
    
    assign w_lt_half = SYN_PRE & ~WSYN_CURR[WIDTH-1];                 // if >һ�룬w_lt_half=0 ����֮=1
    assign do_up     = SYN_PRE & (SYN_BIST_REF ? ~w_lt_half : V_UP);  
    assign do_down   = SYN_PRE & (SYN_BIST_REF ?  w_lt_half : V_DOWN);
	      /*
		  The bistability mechanism is optional: each time a bistability time reference event is received, 
		  if the current synaptic weight is above (resp. below) half its dynamic, it increments (resp. decrements) 
		  toward a high (resp. low) state.
		  */
    assign overflow  = SYN_PRE & ((do_up && (&WSYN_CURR[WIDTH-1:0])) || (do_down && (~|WSYN_CURR[WIDTH-1:0]))); 

	always @(*) begin
		if      (overflow) WSYN_NEW = WSYN_CURR;
		else if (do_up)    WSYN_NEW = WSYN_CURR + {{(WIDTH){1'b0}},1'b1};
		else if (do_down)  WSYN_NEW = WSYN_CURR - {{(WIDTH){1'b0}},1'b1};
		else               WSYN_NEW = WSYN_CURR;
	end 


endmodule
