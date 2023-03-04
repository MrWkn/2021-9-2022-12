//
//------------------------------------------------------------------------------


module neuron_core #(
    parameter N = 256,
    parameter M = 8
)(
    
    // Global inputs ------------------------------------------
    input  wire                 RSTN_syncn,
    input  wire                 CLK,
    
    // Inputs from SPI configuration registers ----------------
    input  wire                 SPI_GATE_ACTIVITY_sync,               
           	/*Gates the network activity and allows the SPI to access the neuron and synapse memories for programming and readback.*/
			
	input  wire                 SPI_PROPAGATE_UNMAPPED_SYN,           
	        /*Allows all the synaptic weights to be propagated to their post-synaptic neuron, independently of the mapping table bit value.
	                                                                  允许将所有突触权重传播到其突触后神经元，与映射表位值无关。*/
    
    // Synaptic inputs ----------------------------------------
    input  wire [         31:0] SYNARRAY_RDATA,                        // 突触的存储单位， 32bit
    input  wire                 SYN_SIGN,                              //判断是否是exc or inh neuron
	    /*assign {syn_sign_dummy,SYN_SIGN} = SPI_SYN_SIGN >> CTRL_SYNARRAY_ADDR[12:5];
      其中CTRL_SYNARRAY_ADDR意思是： Configures each of the 256 ODIN neurons as either inhibitory (1) or excitatory (0),
       i.e. all of their downstream synapses either take a negative (1) or positive (0) sign.*/
    
	
	
    // Inputs from controller ---------------------------------
    input  wire                 CTRL_NEUR_EVENT,         //event
    input  wire                 CTRL_NEUR_TREF,          //if (state == TREF)  CTRL_NEUR_TREF=1'b1;
    input  wire [          4:0] CTRL_NEUR_VIRTS,         //if (state == POP_VIRT)  CTRL_NEUR_VIRTS = SCHED_DATA_OUT[12:M];
    input  wire                 CTRL_NEURMEM_CS,
    input  wire                 CTRL_NEURMEM_WE,
    input  wire [        M-1:0] CTRL_NEURMEM_ADDR,
    input  wire [      2*M-1:0] CTRL_PROG_DATA,
    input  wire [      2*M-1:0] CTRL_SPI_ADDR,
    
    // Inputs from scheduler ----------------------------------
    input  wire                 CTRL_NEUR_BURST_END,
    
    // Outputs ------------------------------------------------
    output wire [        127:0] NEUR_STATE,
    output wire [          6:0] NEUR_EVENT_OUT,
    output reg  [        N-1:0] NEUR_V_UP,
    output reg  [        N-1:0] NEUR_V_DOWN,
    output wire [         14:0] NEUR_STATE_MONITOR
);
    
    // Internal regs and wires definitions

    wire           neur_rstn;
    wire [    2:0] syn_weight;
    wire [   31:0] syn_weight_int;
    wire           syn_sign;                       //判断是否是exc or inh neuron
    wire           syn_event;
    wire           time_ref;
    
    wire           LIF_neuron_v_up_next    ;
    wire           LIF_neuron_v_down_next  ;
    wire [    6:0] LIF_neuron_event_out    ;
    
    wire [   15:0] LIF_neuron_next_NEUR_STATE;
    
    wire [  127:0] neuron_data_int, neuron_data;
    
    genvar i;

    
    // Processing inputs from the synaptic array and the controller
    
    assign syn_weight_int  = SYNARRAY_RDATA >> ({2'b0,CTRL_NEURMEM_ADDR[2:0]} << 2);
    
    assign syn_weight      = |CTRL_NEUR_VIRTS ? CTRL_NEUR_VIRTS[4:2] : (syn_weight_int[2:0] & {3{syn_weight_int[3] | SPI_PROPAGATE_UNMAPPED_SYN}});
    assign syn_sign        = |CTRL_NEUR_VIRTS ? CTRL_NEUR_VIRTS[1]   : SYN_SIGN;
    assign syn_event       =  CTRL_NEUR_EVENT;
    assign time_ref        = |CTRL_NEUR_VIRTS ? CTRL_NEUR_VIRTS[0]   : CTRL_NEUR_TREF;
    

    // Updated or configured neuron state to be written to the neuron memory

    assign neuron_data_int =  {NEUR_STATE[127: 86], LIF_neuron_next_NEUR_STATE, NEUR_STATE[69:0]};
    generate
        for (i=0; i<(N>>4); i=i+1) begin
            assign neuron_data[M*i+M-1:M*i] = SPI_GATE_ACTIVITY_sync
                                            ? ((i == CTRL_SPI_ADDR[2*M-1:M])
                                                     ? ((CTRL_PROG_DATA[M-1:0] & ~CTRL_PROG_DATA[2*M-1:M]) | (NEUR_STATE[M*i+M-1:M*i] & CTRL_PROG_DATA[2*M-1:M]))
                                                     : NEUR_STATE[M*i+M-1:M*i])
                                            : neuron_data_int[M*i+M-1:M*i];
            
        end
    endgenerate
    

    // Neuron UP/DOWN registers for SDSP online learning

    generate
        for (i=0; i<N; i=i+1) begin
            always @(posedge CLK)
                if (CTRL_NEURMEM_CS && CTRL_NEURMEM_WE && (i == CTRL_NEURMEM_ADDR)) begin
                    NEUR_V_UP[i]   <= LIF_neuron_v_up_next   ;
                    NEUR_V_DOWN[i] <= LIF_neuron_v_down_next ;
                end else begin
                    NEUR_V_UP[i]   <= NEUR_V_UP[i];
                    NEUR_V_DOWN[i] <= NEUR_V_DOWN[i];
                end
        end
    endgenerate
    

    // Neuron state monitoring

    assign NEUR_STATE_MONITOR = {LIF_neuron_v_up_next, LIF_neuron_v_down_next, LIF_neuron_next_NEUR_STATE[10:8], 2'b0, LIF_neuron_next_NEUR_STATE[7:0]} ;
    
    // Neuron output spike events
                                /*NEUR_STATE[127]==1 can disables the neuron
								CTRL_NEURMEM_CS && CTRL_NEURMEM_WE 当允许写入neuron memory时   neuron才能output NEUR_EVENT_OUT
								NEUR_EVENT_OUT 会输入 controller and scheduler */
    assign NEUR_EVENT_OUT     = NEUR_STATE[127] ? 7'b0 : ((CTRL_NEURMEM_CS && CTRL_NEURMEM_WE) ?  LIF_neuron_event_out : 7'b0);
    
    
    // Neuron update logic for leaky integrate-and-fire (LIF) model
    
    lif_neuron lif_neuron_0 ( 
        .param_leak_str(         NEUR_STATE[  7:  1]),
		/*Defines the amount by which the membrane potential is decreased in the case of time reference / leakage event. 
        The membrane potential cannot go negative.*/
        .param_leak_en(          NEUR_STATE[      8]),
		/*Enables the leakage mechanism.*/
        .param_thr(              NEUR_STATE[ 16:  9]),
		/*Defines the firing threshold: a spike is issued and the neuron is reset 
        when the membrane potential reaches the thr value.*/
        .param_ca_en(            NEUR_STATE[     17]),
		//Enables the Calcium variable and SDSP online learning in the dendritic tree of the current neuron.
        .param_thetamem(         NEUR_STATE[ 25: 18]),
		//	Defines the SDSP threshold on the membrane potential.
        .param_ca_theta1(        NEUR_STATE[ 28: 26]),
        .param_ca_theta2(        NEUR_STATE[ 31: 29]),
        .param_ca_theta3(        NEUR_STATE[ 34: 32]),
        .param_caleak(           NEUR_STATE[ 39: 35]),
		
         //Contains the current value of the membrane potential
        .state_core(             NEUR_STATE[ 77: 70] ),
        .state_core_next(        LIF_neuron_next_NEUR_STATE[  7:  0]       ),
		//Contains the current value of the Calcium variable
        .state_calcium(          NEUR_STATE[ 80: 78] ),
        .state_calcium_next(     LIF_neuron_next_NEUR_STATE[ 10:  8]       ),
		//Contains the current value of the Calcium variable leakage counter (cfr. ca_leak parameter).
        .state_caleak_cnt(       NEUR_STATE[ 85: 81] ),
        .state_caleak_cnt_next(  LIF_neuron_next_NEUR_STATE[ 15: 11]       ),
        
        .syn_weight(syn_weight),
        .syn_sign(syn_sign),      // inhibitory (!excitatory) configuration bit
        .syn_event(syn_event),    // synaptic event trigger
        .time_ref(time_ref),      // time reference event trigger
        
        .v_up_next(LIF_neuron_v_up_next),
        .v_down_next(LIF_neuron_v_down_next),
        .event_out(LIF_neuron_event_out)  // post neuron spike event output  [6:0]
    );
     

    // Neuron memory wrapper

//    SRAM_256x128_wrapper neurarray_0 (       
        
//        // Global inputs
//        .RSTN       (RSTN_syncn),
//        .CK         (CLK),
    
//        // Control and data inputs
//        .CS         (CTRL_NEURMEM_CS),
//        .WE         (CTRL_NEURMEM_WE),
//        .A          (CTRL_NEURMEM_ADDR),
//        .D          (neuron_data),
        
//        // Data output
//        .Q          (NEUR_STATE)
//    );
    
    neuron_mem_0 neuarray_0(
    .clk(CLK),
    .a(CTRL_NEURMEM_ADDR),
    .d(neuron_data),
    .we(CTRL_NEURMEM_WE),
    .i_ce(CTRL_NEURMEM_CS),
    
    .spo(NEUR_STATE)
    );

endmodule




module SRAM_256x128_wrapper (

    // Global inputs
    input          RSTN,                     // Reset_N
    input          CK,                       // Clock (synchronous read/write)

    // Control and data inputs
    input          CS,                       // Chip select (active high)
    input          WE,                       // Write enable (active high)
    input  [  7:0] A,                        // Address bus 
    input  [127:0] D,                        // Data input bus (write)

    // Data output
    output [127:0] Q                         // Data output bus (read)   
);


    /*
     *  
     *  
     */      
        reg [127:0] SRAM[255:0];
        reg [127:0] Qr;
        always @(posedge CK) begin
            Qr <= CS ? SRAM[A] : Qr;
            if (CS & WE) SRAM[A] <= D;
        end
        assign Q = Qr;
    

endmodule
