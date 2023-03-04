// 
//------------------------------------------------------------------------------


module lif_neuron_state ( 
    input  wire [          6:0] param_leak_str,         // leakage strength parameter
    input  wire                 param_leak_en,          // leakage enable parameter
    input  wire [          7:0] param_thr,              // neuron firing threshold parameter
    input  wire [          7:0] state_core,             // membrane potential state from SRAM 
    input  wire                 event_leak,             // leakage type event
    input  wire                 event_inh,              // excitatory type event
    input  wire                 event_exc,              // inhibitory type event
    input  wire [          2:0] syn_weight,             // synaptic weight
    output wire [          7:0] state_core_next,        // next membrane potential state to SRAM 
    output wire [          6:0] event_out               // neuron spike event output  
);


    reg  [7:0] state_core_next_i;
    wire [7:0] state_leak, state_inh, state_exc;
    wire       spike_out;

    assign spike_out       = (state_core_next_i >= param_thr);
    assign event_out       = {spike_out, 3'b000, 3'b0};                     //event_out  {1 000 000}
    assign state_core_next =  spike_out ? 8'd0 : state_core_next_i;

    always @(*) begin 

            if (event_leak && param_leak_en)                               // 泄露事件 两个信号！
                if (state_core >= state_leak)                              // 大小的判断是为了防止溢出 
                    state_core_next_i = state_leak;
                else
                    state_core_next_i = 8'b0;
            else if (event_inh)
                if (state_core >= state_inh)
                    state_core_next_i = state_inh;
                else
                    state_core_next_i = 8'b0;
            else if (event_exc)
                if (state_core <= state_exc)
                    state_core_next_i = state_exc;
                else
                    state_core_next_i = 8'hFF;
            else 
                state_core_next_i = state_core;
    end

    // 当参数输入时，更新状态
    assign state_leak = (state_core - {1'b0,param_leak_str});
    assign state_inh  = (state_core - {5'b0,syn_weight});
    assign state_exc  = (state_core + {5'b0,syn_weight});

endmodule 
