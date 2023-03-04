module lif_calcium ( 
    input  wire                 param_ca_en,             // calcium concentration enable parameter
    input  wire [          7:0] param_thetamem,          // membrane threshold parameter              [SDSP]
    input  wire [          2:0] param_ca_theta1,         // calcium threshold 1parameter              [SDSP]
    input  wire [          2:0] param_ca_theta2,         // calcium threshold 2 parameter             [SDSP]
    input  wire [          2:0] param_ca_theta3,         // calcium threshold 3 parameter             [SDSP]
    input  wire [          4:0] param_caleak,            // calcium leakage strength parameter        [SDSP]
    input  wire [          2:0] state_calcium,           // calcium concentration state from SRAM     [SDSP]
    input  wire [          4:0] state_caleak_cnt,        // calcium leakage state from SRAM           [SDSP]
    input  wire [          7:0] state_core_next,         // next membrane potential state to SRAM 
    input  wire                 spike_out,               // neuron spike event signal
    input  wire                 event_tref,              // time reference event signal
    output wire                 v_up_next,               // next SDSP UP condition value signal       [SDSP]
    output wire                 v_down_next,             // next SDSP DOWN condition value signal     [SDSP]
    output reg  [          2:0] state_calcium_next,      // next calcium concentration state to SRAM  [SDSP]
    output reg  [          4:0] state_caleak_cnt_next    // next calcium leakage state to SRAM        [SDSP]
);
    reg    ca_leak;
    /*״̬�ж� up or down*/
    assign v_up_next   = param_ca_en && (state_core_next >= param_thetamem) && (param_ca_theta1 <= state_calcium_next) && (state_calcium_next < param_ca_theta3);
    assign v_down_next = param_ca_en && (state_core_next <  param_thetamem) && (param_ca_theta1 <= state_calcium_next) && (state_calcium_next < param_ca_theta2);

    always @(*) begin 
        if (param_ca_en)
            if (spike_out && ~ca_leak && ~&state_calcium)             // ��post_spike���� ��ca_leak == 0���� ��state_calcium δ������� caŨ������
                state_calcium_next = state_calcium + 3'b1;
            else if (~spike_out && ca_leak && |state_calcium)         // ����post_spike���� ��ca_leak == 1���� ��state_calcium δ������� caŨ�ȼ�С
                state_calcium_next = state_calcium - 3'b1;
            else
                state_calcium_next = state_calcium;
        else
            state_calcium_next = state_calcium;
    end

    always @(*) begin 
        // param_caleak = 2 ������
        // event_tref = CTRL_NEUR_EVENT & CTRL_NEUR_TREF
            //ֻ�е��ⲿ����ʱ��ο��¼���event_tref �Ż����1
        if (param_ca_en && |param_caleak && event_tref)              //��param_caleak ��Ϊ0��������Caй¶ǿ�ȣ��� ��event_tref��
            if (state_caleak_cnt == (param_caleak - 5'b1)) begin
                state_caleak_cnt_next = 5'b0;                        // �������� param_caleak ʱ������й¶��ca_leak == 1��
                ca_leak               = 1'b1;
            end else begin
                state_caleak_cnt_next = state_caleak_cnt + 5'b1;
                ca_leak               = 1'b0;
            end
        else begin
            state_caleak_cnt_next = state_caleak_cnt;
            ca_leak               = 1'b0;
        end
    end

endmodule
