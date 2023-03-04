//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

module spi_slave #(
    parameter N = 256,
    parameter M = 8
)(

    // Global inputs -----------------------------------------
    input  wire                 RST_async,//ȫ�ֵĸ�λ�ź� - RST

    // SPI slave interface ------------------------------------
    input  wire                 SCK,
    output wire                 MISO,
    input  wire                 MOSI,

    // Control interface for readback -------------------------
    output reg                  CTRL_READBACK_EVENT,
    output reg                  CTRL_PROG_EVENT,
    output reg  [      2*M-1:0] CTRL_SPI_ADDR,
    output reg  [          1:0] CTRL_OP_CODE,
    output reg  [      2*M-1:0] CTRL_PROG_DATA,  //16-bit
    input  wire [         31:0] SYNARRAY_RDATA,
    input  wire [        127:0] NEUR_STATE,

    // Configuration registers output -------------------------
    output reg                  SPI_GATE_ACTIVITY,
    output reg                  SPI_OPEN_LOOP,
    output reg  [        N-1:0] SPI_SYN_SIGN,
    output reg  [         19:0] SPI_BURST_TIMEREF,
    output reg                  SPI_OUT_AER_MONITOR_EN,
    output reg                  SPI_AER_SRC_CTRL_nNEUR,
    output reg  [        M-1:0] SPI_MONITOR_NEUR_ADDR,
    output reg  [        M-1:0] SPI_MONITOR_SYN_ADDR,
    output reg                  SPI_UPDATE_UNMAPPED_SYN,
	output reg                  SPI_PROPAGATE_UNMAPPED_SYN,
	output reg                  SPI_SDSP_ON_SYN_STIM
); 

	//----------------------------------------------------------------------------------
	//	REG & WIRES :
	//----------------------------------------------------------------------------------
    
	reg  [5:0]     spi_cnt;
    
    wire [   31:0] readback_weight;
    wire [  127:0] readback_neuron;
	
	reg  [19:0]    spi_shift_reg_out, spi_shift_reg_in;
    reg  [19:0]    spi_data, spi_addr;
    
    genvar i;
    

	//----------------------------------------------------------------------------------
	//	SPI circuitry
	//----------------------------------------------------------------------------------

	// SPI counter   spi_cnt��spi_addr
	always @(negedge SCK, posedge RST_async)//spi_cnt��һ������������0������39
		if      (RST_async)        spi_cnt <= 6'd0;
        else if (spi_cnt == 6'd39) spi_cnt <= 6'd0;
		else                       spi_cnt <= spi_cnt + 6'd1;
        
    always @(negedge SCK, posedge RST_async)
		if      (RST_async)        spi_addr <= 20'd0;
		else if (spi_cnt == 6'd19) spi_addr <= spi_shift_reg_in[19:0];   //
        else                       spi_addr <= spi_addr;
	
    always @(posedge SCK)
        spi_shift_reg_in <= {spi_shift_reg_in[18:0], MOSI};
        
	
	// SPI shift register
	always @(negedge SCK, posedge RST_async)
        if (RST_async) begin
            spi_shift_reg_out   <= 20'b0;
            CTRL_READBACK_EVENT <= 1'b0;
            CTRL_PROG_EVENT     <= 1'b0;
            CTRL_SPI_ADDR       <= {(2*M){1'b0}};
            CTRL_OP_CODE        <= 2'b0;
            CTRL_PROG_DATA      <= {(2*M){1'b0}};
		end else if (spi_shift_reg_in[19] && (spi_cnt == 6'd19)) begin  //MSB is R
            spi_shift_reg_out   <= {spi_shift_reg_out[18:0], 1'b0};
            CTRL_READBACK_EVENT <= (spi_shift_reg_in[2*M+1:2*M] != 2'b0);//spi_shift_reg_in[17:16]
            CTRL_PROG_EVENT     <= 1'b0;
            CTRL_SPI_ADDR       <= spi_shift_reg_in[2*M-1:  0];  //spi_shift_reg_in[15:0]
            CTRL_OP_CODE        <= spi_shift_reg_in[2*M+1:2*M];  //spi_shift_reg_in[17:16]
            //CTRL_OP_CODE 01 10 ����ͬ�Ĳ���
            CTRL_PROG_DATA      <= {(2*M){1'b0}};
		end else if (spi_shift_reg_in[18] && (spi_cnt == 6'd19)) begin  //LSB is W
            spi_shift_reg_out   <= 20'b0;
            CTRL_READBACK_EVENT <= 1'b0;
            CTRL_PROG_EVENT     <= 1'b0;
            CTRL_SPI_ADDR       <= spi_shift_reg_in[2*M-1:  0]; //[15:0]
            CTRL_OP_CODE        <= spi_shift_reg_in[2*M+1:2*M]; //[17:16]
            CTRL_PROG_DATA      <= {(2*M){1'b0}};               //{16'b0}
		end else if (spi_addr[19] && (spi_cnt == 6'd31)) begin  //read  ; 0-31 all of 32-bit
            spi_shift_reg_out   <= (CTRL_OP_CODE == 2'b10) ? {readback_weight[7:0],12'b0} : 
                    ((CTRL_OP_CODE == 2'b01) ? {readback_neuron[7:0],12'b0} : {spi_shift_reg_out[18:0], 1'b0}); 
            CTRL_READBACK_EVENT <= 1'b0;
            CTRL_PROG_EVENT     <= 1'b0;
            CTRL_SPI_ADDR       <= CTRL_SPI_ADDR;
            CTRL_OP_CODE        <= CTRL_OP_CODE;
            CTRL_PROG_DATA      <= {(2*M){1'b0}};
		end else if (spi_addr[18] && (spi_cnt == 6'd39)) begin //write  ; 0-39 all of 40-bit
            spi_shift_reg_out   <= {spi_shift_reg_out[18:0], 1'b0};
            CTRL_READBACK_EVENT <= 1'b0;
            CTRL_PROG_EVENT     <= (CTRL_OP_CODE != 2'b0);
            CTRL_SPI_ADDR       <= CTRL_SPI_ADDR;
            CTRL_OP_CODE        <= CTRL_OP_CODE;
            CTRL_PROG_DATA      <= spi_shift_reg_in[2*M-1:0];   //[15:0]
		end else begin
            spi_shift_reg_out   <= {spi_shift_reg_out[18:0], 1'b0};
            CTRL_READBACK_EVENT <= CTRL_READBACK_EVENT;
            CTRL_PROG_EVENT     <= 1'b0;
            CTRL_SPI_ADDR       <= CTRL_SPI_ADDR;
            CTRL_OP_CODE        <= CTRL_OP_CODE;
            CTRL_PROG_DATA      <= CTRL_PROG_DATA;
        end
         
    assign readback_weight = SYNARRAY_RDATA >> (({3'b0,CTRL_SPI_ADDR[2*M-2:2*M-3]} << 3)); //CTRL_SPI_ADDR[14:13]
    assign readback_neuron =     NEUR_STATE >> (({3'b0,CTRL_SPI_ADDR[2*M-1:  M  ]} << 3)); //CTRL_SPI_ADDR[15:8]
    //figure out the SYNARRAY_RDATA and NEUR_STATE.
    
	// SPI MISO
	assign MISO = spi_shift_reg_out[19];

    
	//----------------------------------------------------------------------------------
	//	Output config. registers
	//----------------------------------------------------------------------------------
  
    //SPI_GATE_ACTIVITY - 1 bit - address 0
    always @(posedge SCK)//SPI_GATE_ACTIVITY  ����SPI������Ԫ��ͻ���洢���б�̺ͻض�
        if   (!spi_addr[17] && !spi_addr[16] && (spi_addr[15:0] == 16'd0) && (spi_cnt == 6'd39))    SPI_GATE_ACTIVITY <= MOSI;//[17:16]=00
        else                                                                                        SPI_GATE_ACTIVITY <= SPI_GATE_ACTIVITY;
        
    //SPI_OPEN_LOOP - 1 bit - address 1
    /*Prevents spike events generated locally by the neuron array from entering the scheduler, 
    they will thus not be processed by the controller and the scheduler only handles events received from the input AER interface. */
    always @(posedge SCK)//SPI_OPEN_LOOP  ��ֹ��Ԫarry�ڱ��ز����ļ���¼�������������������ǲ��ᱻ����������������ֻ�����AER�ӿڽ��յ����¼���
        if   (!spi_addr[17] && !spi_addr[16] && (spi_addr[15:0] == 16'd1) && (spi_cnt == 6'd39))   SPI_OPEN_LOOP <= MOSI;
        else                                                                                       SPI_OPEN_LOOP <= SPI_OPEN_LOOP;
    
    
    //MOSI???
    //SPI_SYN_SIGN - 256 bits - addresses 2 to 17
    generate
        for (i=0; i<(N>>4); i=i+1) begin  //i [0:15]
            always @(posedge SCK)//��256����Ԫ�е�ÿһ������Ϊ�����Ի��˷���
                if   (!spi_addr[17] && !spi_addr[16] && (spi_addr[15:0] == (16'd2+i)) && (spi_cnt == 6'd39)) SPI_SYN_SIGN[16*i+15:16*i] <= {spi_shift_reg_in[14:0], MOSI};
                else                                                                                         SPI_SYN_SIGN[16*i+15:16*i] <= SPI_SYN_SIGN[16*i+15:16*i];
        end
    endgenerate
    
    //SPI_BURST_TIMEREF - 20 bits - address 18
    always @(posedge SCK)//�������ӵ��ȳ��������������������ʱ�����ڣ�����ʹ����Ԫͻ����Ϊʱ���ã����򣬸üĴ���Ӧ����Ϊ0��
        if   (!spi_addr[17] && !spi_addr[16] && (spi_addr[15:0] == 16'd18) && (spi_cnt == 6'd39))  SPI_BURST_TIMEREF <= {spi_shift_reg_in[18:0], MOSI};
        else                                                                                       SPI_BURST_TIMEREF <= SPI_BURST_TIMEREF;
    
    //SPI_AER_SRC_CTRL_nNEUR - 1 bit - address 19
    always @(posedge SCK)//������Ԫ����ʱAER����¼�����Դ�������¼�������ʱ������Ԫ or �ӿ���������
        if   (!spi_addr[17] && !spi_addr[16] && (spi_addr[15:0] == 16'd19) && (spi_cnt == 6'd39))  SPI_AER_SRC_CTRL_nNEUR <= MOSI;
        else                                                                                       SPI_AER_SRC_CTRL_nNEUR <= SPI_AER_SRC_CTRL_nNEUR;
    
    //SPI_OUT_AER_MONITOR_EN - 1 bit - address 20
    /*Enables automatic neuron and synapse state monitoring through the AER output */
    always @(posedge SCK)
        if   (!spi_addr[17] && !spi_addr[16] && (spi_addr[15:0] == 16'd20) && (spi_cnt == 6'd39))  SPI_OUT_AER_MONITOR_EN <= MOSI;
        else                                                                                       SPI_OUT_AER_MONITOR_EN <= SPI_OUT_AER_MONITOR_EN;
    
    //SPI_MONITOR_NEUR_ADDR - M bit - address 21
    /*	Neuron address to be monitored if SPI_OUT_AER_MONITOR_EN is asserted.*/
    always @(posedge SCK)
        if   (!spi_addr[17] && !spi_addr[16] && (spi_addr[15:0] == 16'd21) && (spi_cnt == 6'd39))  SPI_MONITOR_NEUR_ADDR <= {spi_shift_reg_in[M-2:0], MOSI};
        else                                                                                       SPI_MONITOR_NEUR_ADDR <= SPI_MONITOR_NEUR_ADDR;
    
    //SPI_MONITOR_SYN_ADDR - M bit - address 22
    /*Synapse address of the post-synaptic neuron SPI_MONITOR_NEUR_ADDR to be monitored if SPI_OUT_AER_MONITOR_EN is asserted.*/
    always @(posedge SCK)
        if   (!spi_addr[17] && !spi_addr[16] && (spi_addr[15:0] == 16'd22) && (spi_cnt == 6'd39))  SPI_MONITOR_SYN_ADDR <= {spi_shift_reg_in[M-2:0], MOSI};
        else                                                                                       SPI_MONITOR_SYN_ADDR <= SPI_MONITOR_SYN_ADDR;

    //SPI_UPDATE_UNMAPPED_SYN - 1 bit - address 23
    /*Allows SDSP online learning to be carried out in all synaptic weights, even in synapses whose mapping table bit is disabled*/
    always @(posedge SCK)
        if   (!spi_addr[17] && !spi_addr[16] && (spi_addr[15:0] == 16'd23) && (spi_cnt == 6'd39))  SPI_UPDATE_UNMAPPED_SYN <= MOSI;
        else                                                                                       SPI_UPDATE_UNMAPPED_SYN <= SPI_UPDATE_UNMAPPED_SYN;
    
	//SPI_PROPAGATE_UNMAPPED_SYN - 1 bit - address 24
	/*	Allows all the synaptic weights to be propagated to their post-synaptic neuron, independently of the mapping table bit value.*/
    always @(posedge SCK)
        if   (!spi_addr[17] && !spi_addr[16] && (spi_addr[15:0] == 16'd24) && (spi_cnt == 6'd39))  SPI_PROPAGATE_UNMAPPED_SYN <= MOSI;
        else                                                                                       SPI_PROPAGATE_UNMAPPED_SYN <= SPI_PROPAGATE_UNMAPPED_SYN;
    
	//SPI_SDSP_ON_SYN_STIM - 1 bit - address 25
	/*Enables SDSP online learning for synapse events*/
    always @(posedge SCK)
        if   (!spi_addr[17] && !spi_addr[16] && (spi_addr[15:0] == 16'd25) && (spi_cnt == 6'd39))  SPI_SDSP_ON_SYN_STIM <= MOSI;
        else                                                                                       SPI_SDSP_ON_SYN_STIM <= SPI_SDSP_ON_SYN_STIM; 
	
    /*                                                 *
     * Some address room for other params if necessary *
     *                                                 */

    
    
endmodule
