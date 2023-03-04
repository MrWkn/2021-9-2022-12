// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Thu Aug 18 16:05:21 2022
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 6464)
`pragma protect data_block
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
jX+3Vd/y2KEYBtddlf9SY7d5nA9KQDA=
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
