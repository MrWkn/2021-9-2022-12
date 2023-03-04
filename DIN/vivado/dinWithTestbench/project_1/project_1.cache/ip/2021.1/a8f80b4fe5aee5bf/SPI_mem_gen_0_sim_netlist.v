// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Sun Oct 30 20:49:45 2022
// Host        : LAPTOP-07KLTU7T running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ SPI_mem_gen_0_sim_netlist.v
// Design      : SPI_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu9eg-ffvb1156-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "SPI_mem_gen_0,dist_mem_gen_v8_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2021.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (a,
    qspo_ce,
    spo);
  input [10:0]a;
  input qspo_ce;
  output [0:0]spo;

  wire [10:0]a;
  wire [0:0]spo;
  wire [0:0]NLW_U0_dpo_UNCONNECTED;
  wire [0:0]NLW_U0_qdpo_UNCONNECTED;
  wire [0:0]NLW_U0_qspo_UNCONNECTED;

  (* C_FAMILY = "zynquplus" *) 
  (* C_HAS_D = "0" *) 
  (* C_HAS_DPO = "0" *) 
  (* C_HAS_DPRA = "0" *) 
  (* C_HAS_I_CE = "0" *) 
  (* C_HAS_QDPO = "0" *) 
  (* C_HAS_QDPO_CE = "0" *) 
  (* C_HAS_QDPO_CLK = "0" *) 
  (* C_HAS_QDPO_RST = "0" *) 
  (* C_HAS_QDPO_SRST = "0" *) 
  (* C_HAS_WE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_PIPELINE_STAGES = "0" *) 
  (* C_QCE_JOINED = "0" *) 
  (* C_QUALIFY_WE = "0" *) 
  (* C_REG_DPRA_INPUT = "0" *) 
  (* c_addr_width = "11" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "1040" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_clk = "0" *) 
  (* c_has_qspo = "0" *) 
  (* c_has_qspo_ce = "1" *) 
  (* c_has_qspo_rst = "0" *) 
  (* c_has_qspo_srst = "0" *) 
  (* c_has_spo = "1" *) 
  (* c_mem_init_file = "SPI_mem_gen_0.mif" *) 
  (* c_parser_type = "1" *) 
  (* c_read_mif = "1" *) 
  (* c_reg_a_d_inputs = "0" *) 
  (* c_sync_enable = "1" *) 
  (* c_width = "1" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 U0
       (.a(a),
        .clk(1'b0),
        .d(1'b0),
        .dpo(NLW_U0_dpo_UNCONNECTED[0]),
        .dpra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .i_ce(1'b1),
        .qdpo(NLW_U0_qdpo_UNCONNECTED[0]),
        .qdpo_ce(1'b1),
        .qdpo_clk(1'b0),
        .qdpo_rst(1'b0),
        .qdpo_srst(1'b0),
        .qspo(NLW_U0_qspo_UNCONNECTED[0]),
        .qspo_ce(1'b0),
        .qspo_rst(1'b0),
        .qspo_srst(1'b0),
        .spo(spo),
        .we(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2021.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
JqLVJNxQZkLohSEqQ9ITFybNm9QPcaTh8kyc7h4uGNwD1GaEe9dZHqj61sUilGTlF+FUk7afNjXe
+9yQ4e75SyWC3Z6F0o0CdI6t84E2VRqNvne6PMLMbSrRPmTgt8cbodbZa3saUKncQltVwK/zTxXc
dXyeIJwoVnylCRZ8MPU=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
RMR60V/K16S3hDpcgdlFzH6vzNttFBxzcEIP9k8l6xLxOXzEGeRk2beZg3IkkpX9ywpiLolj/ijd
pAlaBccK0sBT48q6qTKLouly7vRT3U8EOwOAJBZoDUnL/NwrlIomkg8Pj/4x8iecc9IFkdcLg53k
dreGnJ/4ti8Qi6sHP5Vsy0qpJoYpWsOBc2cmgH9vayWn6WlV7QL8YjnFQ6bQnWuyarN2QQK+bLzc
JrPAdTBzH05U9MiHwKRG1GlZxJA5fxQttnLA39Nwggz6r5qeYai4Vo+J8h0NQDa/GYHeYKSYsF9p
VKrYe14mz3CSYvF3+NMCtnCz+VeW7lF95iKCXA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
k6iMAgjYok8KaQLMY/TME6/aSCYTKFMZWtHwbD2VKIKOoM9woUSioI0NuiYfkPizuiBJEl8Af3NJ
M5VmpW3SVM0lwPjVSCSNmHMIfc2krrmg962M4XaG4w+tnp7hwZbdNZ8ahj6pOLDYSTGKwdGQanuk
rIQbC+15rT9WEK2XGDQ=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lHyAdhaPyzMCy12MalQZTt5ud3be/nityQmJ518pNrYUzgCs2nz/J1pZZgf+RWFgX9JUwWOgttjl
3vfihnzL/+pRWaWe8tlTToa5xX6V/jpw3hAcktXx9YKYreiOr2qpeTLkbp0k6MDPx0OZ6zF6OnXU
mj71WlXFOMXCx/95ZDxCuphivrOiA+pFZwGv2NIFmX/Oh4q8NTSFzJYzF3L9rWrI08UUEu9QuuxY
Iqlhuw+fXq//x9+jC7JNcedTSCXVkefBvZdJcbH0kbNA5ChG445apiF/OiKhKxTUjVKp7Rkm62fE
cFEo6KH1Cp+QaVxNQ55dcOTpVSSDpQGvshrQzw==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
D53lVPGhmka10zY9LQFvI7i1UPoiOm2NaQ+1PpDUs4OCbAMqPLHQSHIZ3EMPWpwgdfAtW9t+9lxl
o33XZq60DBUJ4ZKPRvcfbZCHmpPyjm3Rs8+ACxnIH7G37stehOSCzSXeqM9ORqajk0MjoE3bDLx9
FtW+eEPY1KauFU6KHAWAdaZPPnc5QfgBkK0c27Y7CfkJ049Sjv4lFwtiVOmSkCvdDDisv3/WAcSs
c5Zo+cJIWzw/prfWYTGIB0goZNZRXZpB/aULwQ5itLufopA2f9cHo50fqlIvQX4YoYlfQTXpj3Lj
Qd+7/1UmFCqQLsnOUXy9D/tgspVDu7POGbmsiA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_01", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bN8g8/EQJ5JNLmcuNioMXeo6xxPhQlbGMqXyUcnPTkqRMGYI+G4Ejpt9cT2XLx48MsTE+bzhGByG
1H1pqr4NO588pcozvxJ5bo7FJRCIhLP1e3pwipkX+z6IlClWyStmkrlQmh4o/jTM/s88Fv0m7FSH
jNd3hhAeYNPIdw9Btn4UcBuZre9QZnCZ+Qb3nW7FuuEd1RxTmP0y9EFC185+bRy+SMigW3FTt75l
qdmakEvm3BkGv3IiztGz6MLRqvBdHQYtaZ17Jeh1xGZ//F4QzRytN/lcdqSrZA6MOo1ObtGE9SFJ
SDo82E2CZlkQZfPVe6EC4/a7V7wIwES5EDHHnw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ewjro/5A8FySdAgSJfHQFGxdnPvtSB6vt25wsSfZkZlB9FCU7IhXRDEGCyqtZv1GE8Vi5CjQkNFt
lkkrCSRYIU5yoD/IUiSUo3oerXD+F7eyfUTsdMH8pyAOmszG4J/U4h2F0oGz4IGjnQhlKadatt3U
Pet1uDdo6p7Uz7fluWoE453v5O5Ag7QL3l2r7pK9QbtKW2b2ZgHI0FP1PfpuAESmBITtaB68uLNI
9IqIpc/l+MM956Gz3Ei4nFXbBqRkNnOoEIr1KKujTAkLJl3zAW45fRxt/SNdspyyOfwqw8HQ4aKl
7gQZLNfO7M9S9RaTP7tfDlNXrjIs40/SiH7VMA==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
BU7byHg11K8bY2oU9sv2hTEzfbBQxIL/wbPRcw3zRiIVklygkCLwToVotzcIxQi5+AgzzF89UJr5
6GTSf74dEO/L+7MiiVhop835AvOvvIFH3e15os3Ed8MZ/CykLdSs8kOVPSgygUECxKL/9FDmPOPu
fo2rClbqDh81jw/cX48EVuss3UxP/PNd7DI06TMx7v4Cwbv+pkvbuSJ9JUQBcJB2a2vbXuFSdPnT
ejL1XTVXeTbl2M6D7N0iqk4rwD1DAC1ao/d+axn50hvVPzigrvjqcQX/U1IENh7yF/bcNB1NT4d2
IdXJlmV2SEYwQNjb9ZTuSLUlehhVKrT3vH5zFJC80glrrjZK2l4tx9ZECJLmYjz00oxWf1dNVI0i
SuSyr3w6cWekzZQOv6vsFN+CRqWOkos5IUF5EaLFMFmcV5BtlgtZ9rm6OCo3zn726oQF5zZNaTBv
qrb5vLe4ELSA4fL4YBwiVDxVDpGpLzJNu+m6WS/V5oWJs1UQV1sRHSGu

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
dAIafnl1hEJ76Z8bYZlZKSAU+OyCQ2PwlK+IUKj9QNvxJJYU8c0z5dZmxP4ePLBS+vp0Lekmf+JK
ZmwpMP0AH+BW93Y8Y+QNBeNdszz6mwXF1zf7ZAzf+51PzoZEli3SBCs9JMOdSCtnTg1W+j4FkEYs
NWN3ZK6tfrYSbplsV4lsmoYu2c81xW2Ns3lV8YRQCE8VSADdb1pe8pEztQYXzBmAfCVgwFNJ1kXV
pEtDN1MRi07FvYZeUJ/cX+ebYB0p5w0vxVO4vSr0XOHKMcQkxb/64oEoe4AhHQNWURWYKDxNNzm+
jElAKl1fJL20OmItj+GmJlETFK09uAgqwtZ5HQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7680)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
