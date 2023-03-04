module lif_neuron ( 
    input  wire [          6:0] param_leak_str,          // leakage strength parameter
    input  wire                 param_leak_en,           // leakage enable parameter
    input  wire [          7:0] param_thr,               // neuron firing threshold parameter
    input  wire                 param_ca_en,             // calcium concentration enable parameter    [SDSP]
    input  wire [          7:0] param_thetamem,          // membrane threshold parameter              [SDSP]
    input  wire [          2:0] param_ca_theta1,         // calcium threshold 1 parameter             [SDSP]
    input  wire [          2:0] param_ca_theta2,         // calcium threshold 2 parameter             [SDSP]
    input  wire [          2:0] param_ca_theta3,         // calcium threshold 3 parameter             [SDSP]
    input  wire [          4:0] param_caleak,            // calcium leakage strength parameter        [SDSP]
    
    (* mark_debug = "true" *)input  wire [          7:0] state_core,              // membrane potential state from SRAM 
    (* mark_debug = "true" *)output wire [          7:0] state_core_next,         // next membrane potential state to SRAM
    input  wire [          2:0] state_calcium,           // calcium concentration state from SRAM     [SDSP]
    output wire [          2:0] state_calcium_next,      // next calcium concentration state to SRAM  [SDSP]
    input  wire [          4:0] state_caleak_cnt,        // calcium leakage state from SRAM           [SDSP]
    output wire [          4:0] state_caleak_cnt_next,   // next calcium leakage state to SRAM        [SDSP]
    
    (* mark_debug = "true" *)input  wire [          2:0] syn_weight,              // synaptic weight
    input  wire                 syn_sign,                // inhibitory (!excitatory) configuration bit
    (* mark_debug = "true" *)input  wire                 syn_event,               // synaptic event trigger
    (* mark_debug = "true" *)input  wire                 time_ref,                // time reference event trigger
    
    output wire                 v_up_next,               // next SDSP UP condition value              [SDSP]
    output wire                 v_down_next,             // next SDSP DOWN condition value            [SDSP]
    output wire [          6:0] event_out                // neuron spike event output  
);


    wire       event_leak, event_tref;
    wire       event_inh;
    wire       event_exc;

    assign event_leak =  syn_event  & time_ref;  // ֻ��ʱ��ο�ʱ��ʱ�� ���� event_leak = 1
    assign event_tref =  event_leak;            //  ֻ��ʱ��ο�ʱ��ʱ�� ���� event_tref = 1
    //  ֻҪ����ʱ��ο��¼��� ���� event_leak = event_tref = 0
    // SPI������ͻ������Ԫ����Ϊ�˷�����Ԫ����syn_sign=0
    // ������������ POP_NEURON ���� SYNAPSE ״̬ʱ �� event_exc = 1
    assign event_exc  = ~event_leak & (syn_event & ~syn_sign);
    //event_inh ����0  
    assign event_inh  = ~event_leak & (syn_event &  syn_sign);  

        
    lif_calcium calcium_0 ( 
        .param_ca_en(param_ca_en),
        .param_thetamem(param_thetamem),
        .param_ca_theta1(param_ca_theta1),
        .param_ca_theta2(param_ca_theta2),
        .param_ca_theta3(param_ca_theta3),
        .param_caleak(param_caleak),
        .state_calcium(state_calcium),
        .state_caleak_cnt(state_caleak_cnt),
        .state_core_next(state_core_next),
        .spike_out(event_out[6]),
        .event_tref(event_tref),
        .v_up_next(v_up_next),
        .v_down_next(v_down_next),
        .state_calcium_next(state_calcium_next),
        .state_caleak_cnt_next(state_caleak_cnt_next)
    );

    lif_neuron_state neuron_state_0 (
        .param_leak_str(param_leak_str),
        .param_leak_en(param_leak_en),
        .param_thr(param_thr),
        .event_leak(event_leak),
        .event_inh(event_inh),
        .event_exc(event_exc),
        .syn_weight(syn_weight), 
        .state_core(state_core),  //�������Ĥ��λ  in
        .state_core_next(state_core_next),   //���ȥ����һ��Ĥ��λ  out
        .event_out(event_out)
    );


endmodule
