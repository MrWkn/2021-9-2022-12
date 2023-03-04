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
    //˫��̬�¼� SYN_BIST_REF = 1   ���¼�����Ȩ��  ���漰�κ�һ����Ԫ
    assign overflow  = SYN_PRE & ((do_up && (&WSYN_CURR[WIDTH-1:0])) || (do_down && (~|WSYN_CURR[WIDTH-1:0]))); 
	always @(*) begin
		if      (overflow) WSYN_NEW = WSYN_CURR;
		else if (do_up)    WSYN_NEW = WSYN_CURR + {{(WIDTH){1'b0}},1'b1};
		else if (do_down)  WSYN_NEW = WSYN_CURR - {{(WIDTH){1'b0}},1'b1};
		else               WSYN_NEW = WSYN_CURR;
	end 
endmodule
/*
��ͬ�¼������ͻ��Ȩ����α����£�  ���������¼���Ȩ��ÿ��ֻ��仯1
1.�����¼���
    ������Ԫ�е�SDSP���������ж�do_up��do_down�ź� ������ͻ��ģ�飬����ͻ��Ȩ�� 
2.˫��̬�¼��ο��¼���
    ����Ԫû�й�ϵ�������ĸ���Ȩ���Ƿ񳬹���w  ������Ȩ�ء���˿��ܻ��γ�LTP ��ʱ����ǿЧӦ
3.ʱ��ο�ʱ�䣺  
    ������Ԫ�е�SDSP���������ж�do_up��do_down�ź� ������ͻ��ģ�飬����ͻ��Ȩ�� 
*/