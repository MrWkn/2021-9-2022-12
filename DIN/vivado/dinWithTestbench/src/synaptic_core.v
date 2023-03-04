// 
//------------------------------------------------------------------------------


module synaptic_core #(
    parameter N = 256,
    parameter M = 8
)(
    
    // Global inputs ------------------------------------------
    input  wire           RSTN_syncn,
    input  wire           CLK,
    
    // Inputs from SPI configuration registers ----------------
    input  wire           SPI_GATE_ACTIVITY_sync,
    input  wire [  N-1:0] SPI_SYN_SIGN, 
    input  wire           SPI_UPDATE_UNMAPPED_SYN,
    
    // Inputs from controller ---------------------------------
    input  wire [    7:0] CTRL_PRE_EN,
    input  wire           CTRL_BIST_REF,                             //双稳态事件使能
    input  wire           CTRL_SYNARRAY_WE,
    input  wire [   12:0] CTRL_SYNARRAY_ADDR,                     //synapse_word_address
    input  wire           CTRL_SYNARRAY_CS,
    input  wire [2*M-1:0] CTRL_PROG_DATA,
    input  wire [2*M-1:0] CTRL_SPI_ADDR,
    
    // Inputs from neurons ------------------------------------
    input  wire [  N-1:0] NEUR_V_UP,
    input  wire [  N-1:0] NEUR_V_DOWN,
    
    // Outputs ------------------------------------------------
    output wire [   31:0] SYNARRAY_RDATA,
    output wire [   31:0] SYNARRAY_WDATA,
    output wire           SYN_SIGN
);

    // Internal regs and wires definitions
    
    wire [   31:0] SYNARRAY_WDATA_int;
    wire [  N-1:0] NEUR_V_UP_int, NEUR_V_DOWN_int;
    wire [  N-2:0] syn_sign_dummy;
    
    genvar i;
    
    
    // SDSP update logic

    generate
        for (i=0; i<8; i=i+1) begin
        
            sdsp_update #(
                .WIDTH(3)
            ) sdsp_update_gen (
                // Inputs
                    // General
                .SYN_PRE(CTRL_PRE_EN[i] & (SPI_UPDATE_UNMAPPED_SYN | SYNARRAY_RDATA[(i<<2)+3])),
                /*
                SYN_PRE == 1，使能
                1.CTRL_PRE_EN[i]
                if (state == BIST)      CTRL_PRE_EN  = 8'hFF;
                if (state == SYNAPSE)   CTRL_PRE_EN  = {7'b0, SPI_SDSP_ON_SYN_STIM} << AERIN_ADDR[2:0];
                if (state == POP_NEUR)  CTRL_PRE_EN = (ctrl_cnt[3:0] == 4'b0001) ? 8'hFF : 8'b0;
                
                2.SPI_UPDATE_UNMAPPED_SYN:
                Allows SDSP online learning to be carried out in all synaptic weights, even in synapses whose mapping table bit is disabled.
                
                3.SYNARRAY_RDATA[(i<<2)+3]
                SYNARRAY_RDATA[4i+3]:  MSB 是 mapping table bit 
                         MSB can (i) to select which synapses are enabled (i.e. whether their synaptic weight is added to the post-synaptic neuron) or 
                                (ii) to select which synapses are plastic with SDSP or static.
                */				
                .SYN_BIST_REF(CTRL_BIST_REF),
                    // From neuron
                .V_UP(NEUR_V_UP_int[i]),
                .V_DOWN(NEUR_V_DOWN_int[i]),    
                    // From SRAM
                .WSYN_CURR(SYNARRAY_RDATA[(i<<2)+3:(i<<2)]),
                
                // Output
                .WSYN_NEW(SYNARRAY_WDATA_int[(i<<2)+3:(i<<2)])
		    );
        end
    endgenerate

     /*      二进制表示的数字，仍当作一个数值进行移位操作
        	 {3'b0,CTRL_SYNARRAY_ADDR[4:0]} << 3 表示 post_neuron 的高5位地址，因为每个存储单位包括 8 个突触，
			 所以 以高5位作为移位的基准。
	 */
    assign NEUR_V_UP_int   = NEUR_V_UP   >> ({3'b0,CTRL_SYNARRAY_ADDR[4:0]} << 3);
    assign NEUR_V_DOWN_int = NEUR_V_DOWN >> ({3'b0,CTRL_SYNARRAY_ADDR[4:0]} << 3);
	


    // Updated or configured weights to be written to the synaptic memory

    generate
        for (i=0; i<4; i=i+1) begin
            assign SYNARRAY_WDATA[(i<<3)+7:(i<<3)] = SPI_GATE_ACTIVITY_sync
                                                   ?
                                                       ((i == CTRL_SPI_ADDR[14:13])
                                                       ? ((CTRL_PROG_DATA[M-1:0] & ~CTRL_PROG_DATA[2*M-1:M]) | (SYNARRAY_RDATA[(i<<3)+7:(i<<3)] & CTRL_PROG_DATA[2*M-1:M]))
                                                       : SYNARRAY_RDATA[(i<<3)+7:(i<<3)])
                                                   : SYNARRAY_WDATA_int[(i<<3)+7:(i<<3)];
        end
    endgenerate
    
    
    // Synaptic memory wrapper

//    SRAM_8192x32_wrapper synarray_0 (
        
//        // Global inputs
//        .RSTN       (RSTN_syncn),
//        .CK         (CLK),
	
//		// Control and data inputs
//		.CS         (CTRL_SYNARRAY_CS),
//		.WE         (CTRL_SYNARRAY_WE),
//		.A			(CTRL_SYNARRAY_ADDR),
//		.D			(SYNARRAY_WDATA),
		
//		// Data output
//		.Q			(SYNARRAY_RDATA)
//    );
        synapse_mem_0 synarray_0 (
        
        // Global inputs
        .clk         (CLK),
	
		// Control and data inputs
		.i_ce         (CTRL_SYNARRAY_CS),
		.we         (CTRL_SYNARRAY_WE),
		.a			(CTRL_SYNARRAY_ADDR),
		.d			(SYNARRAY_WDATA),
		
		// Data output
		.spo			(SYNARRAY_RDATA)
    );
    assign {syn_sign_dummy,SYN_SIGN} = SPI_SYN_SIGN >> CTRL_SYNARRAY_ADDR[12:5];


endmodule




module SRAM_8192x32_wrapper (

    // Global inputs
    input         RSTN,                     // Reset
    input         CK,                       // Clock (synchronous read/write)

    // Control and data inputs
    input         CS,                       // Chip select (active low) (init low)
    input         WE,                       // Write enable (active low)
    input  [12:0] A,                        // Address bus 
    input  [31:0] D,                        // Data input bus (write)

    // Data output
    output [31:0] Q                         // Data output bus (read)   
);


    /*
     *  Simple behavioral code for simulation, to be replaced by a 8192-word 32-bit SRAM macro 
     *  or Block RAM (BRAM) memory with the same format for FPGA implementations.
     */      
        reg [31:0] SRAM[8191:0];
        reg [31:0] Qr;
        always @(posedge CK) begin
            Qr <= CS ? SRAM[A] : Qr;
            if (CS & WE) SRAM[A] <= D;
        end
        assign Q = Qr;

    
endmodule
