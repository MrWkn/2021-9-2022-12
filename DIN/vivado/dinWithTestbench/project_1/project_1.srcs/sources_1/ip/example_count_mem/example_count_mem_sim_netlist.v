// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sun May  8 00:06:20 2022
// Host        : laptop-ycy running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/ycy/Desktop/ODIN/test_ODIN/test_ODIN/test_ODIN.srcs/sources_1/ip/example_count_mem/example_count_mem_sim_netlist.v
// Design      : example_count_mem
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu9eg-ffvb1156-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "example_count_mem,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module example_count_mem
   (clka,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [6:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [7:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [7:0]douta;

  wire [6:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]douta;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [7:0]NLW_U0_doutb_UNCONNECTED;
  wire [6:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [6:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "7" *) 
  (* C_ADDRB_WIDTH = "7" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.675428 mW" *) 
  (* C_FAMILY = "zynquplus" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "example_count_mem.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "100" *) 
  (* C_READ_DEPTH_B = "100" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "8" *) 
  (* C_READ_WIDTH_B = "8" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "100" *) 
  (* C_WRITE_DEPTH_B = "100" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "zynquplus" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  example_count_mem_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[7:0]),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[6:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[6:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[7:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2020.2"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
QGLtnqZzRetDH6gCWT4Js6wuLlZfrNx/VJp3sfR2NF+cxypO5AxN0oDKLJJtmdrtE/ueNDg+Qf7Z
TqBNRojORA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
B6Ger3hRvfjHkaJ+W8639Kl3TzC9TogLuklOXEiMNdc4Im+DjEUzxb3DKlzu0VW3zxZqjJ3+wsW/
LnRmPCESi5Y9eRJaLFXg79EMfoj4X+nTdHAP6yCfltBADKegZ12gpnB/8ey5yn2KA74LUtPC7jna
iyjqSfsWLGnz6UdXzwk=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BX+DxgMPRyZbYojCUR9Sk8Lq+3ZigBz4yMFHQkmurfdfDzyTPJCE827eGiPyTenK1QPVhEtf9g06
0BFXq/0COPuU1BWJwdkz1c4dE6/exDwhvEh+hPx3vRY6z8fDEf6aGVIXrHDvrmddehe7yMSIpo+k
aXHR06EEdfHCFY4TggYwhcJVXjkE+ApsVuyfmEfPmYjo8hCWyQyBsUWIOY03q1+MvUjjsmTwgs9g
fh5MY9ToaLfoJxPKdCpsqrBX4LJ+VDGFlAqIcqHTE2jCmPiToZAFXB7fzf1wDjFCBlJyFVDBGi0i
m+CouLSb7X1mvVhdDZgNrZDJMV688Bu3o54vew==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
DaIU/Ddc8USbZ2mURzujJDWDH1JbHl5tFVOOQ2aVaUPIA71yyE38OXVLEtF8rNmujYH30nEeQ+FV
LVJ16aaHw+iiuaqorTM3K5KLohVlN+WlcEtSXHuPNHjw8ddqtzpaX7pH1zqZH+YmfCL5oaNLqDH4
rkBnUl0/Gm/hzSwKjYhXGQFYQ+gGP99OjXakzrAqZzp/Iq4gt+Z5902/JV9thd/isHQImJ0QyK8M
EKM579iPAfXGes2mbiNYHcvDmSPYmW1zlhOE++N1EKeea7j/msnKeyhlC+hGE4Xfn4TVvqgQexCT
rp/wS/MosY6WH1aKFQlFH2hEppA7KXUaQlvG+w==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
XmWoAt4X8hrCJ5yTyug4ajJW5UhfkLNibzjihWzZ4Cr9hQSvWZoTc8rjGsLPbz6Le+/9iI5KxecS
eR0wiAO+G2IkwhZgVBeZdKoFnlnTVAyLjk9wMAFXNyJZM6b1NDbfXlPcUsC6JePvPlwwdWknkSsC
r3KvgkWAS+O3xvRmaNw=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Hw3Y+rShKrXiUViyNU1/O2qv6TgheLHBnFMj1i9MUGrHYqh9pLfLYUgWR7S2vj4jv4S+Ks0BpP4p
dKEqVAFmTCfQNEUHaVcFPkOHgig6L4mhLY6HUUKJoRgiQepgLi/W3V+ZZPQSQFkB3CU4MsJzhXvR
yLcpDriZy8cnAHD87Zi5DrNGBzj3kigJeM0du6lCQbxtF5aEdoaNP+YTnIFtcqYhoYnswQlYt0sV
HKgFA8VzqzL5WYnpH7+1IKmFkJBHkyqHCa9wPK0qCKnxkuDj70YzPVqQ+cocdKU+/gNdpCOdZlci
F2HTxrgfrXndJru3TiDqu4UavqAe0MNuFp3t0w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XPVggoWL6aXz+MpODTOZhEUQDa0vfEnUDaYeEHXm2vGyqKJujN2c/FFAFBeBYdJATLsIsQ+BqoPc
pBbcFYXDBfOtFIW2dH6Y1OoD65KyJ/hAq8coa21kFgq4hFat5vzZ2iIfkCpTUr4vDZO7Xne8cZO9
WsHffoTCt5rS59wWm2b8I5R8Eh2TUbQg3RCyrcnD66cvcEnlXe1CNMQ4/loVJpA4IBinBf820Wjc
vw2fZbGI0jXC+ACSHOviH63Xwmn+aRV5Ppkup7IYoon/ieKapRQeASu3TTY37xSBXiInSdtMTzJ6
+4GfO4eSHVriCk/sWbuTBzfRzoSShrnHjzz5LA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2020_08", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
L78XuiswVcgO2gtebzL7SA9BC/jJGAM0v6S9pzmyqL+QYzRneiYeGyDmsW33jEVVSTuNjTXkBLY7
yTOKQruatwe4V0OLi6174saSAmPgerSV1GyLP7KhmusLV/N61avC9TPam+tekhKeE0tds4EnJ3et
4JdLh+SE4Z4pcuqCjB5MFneIYKKWDx7siU6oesAQtoSJOesfMchX63MhOjOHFP/ch+1gHv3T45hg
IGF7V7TrdREVE4f9631tlVJ1o2Dypsmo/76Itz5WCGlTMjAnWXN8IXxKN+PZ3dyt1wjrZm2P/td+
xiGszFnSLrRvw/HferwtSmRx8q0fiHZ88roGTw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kDX5kq2QEe25429T6vQqBCFvV1McKTJRYfK99ymVNK2GGvGLXSzgwJHwB2fj9rM0wme3zYYY0vQR
x+9F4L7KLlOVY6qY3LB59uDzyXBI3mMZaS905HXHJkdZHWtQWpfHhl27LqL+8FSluaD6F+KFfYOV
CwIOVuCIp/XjxFXpNBik7YiPt4kHOlDA97IXNLnYUn/g1csGqeNWce4UTne50ggWvLYGbTFGmTjT
N67TpUiGRVRCSv8Tax72GWFIMFZk3Tlp68ZUSQEybZMWX1U9XdMdtxfvNGhf8mi5jQJ2SupSzKu4
T/+53IN9T8aLePAiGBKKG1ZBj4y1ZyYA7XYvjw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 22128)
`pragma protect data_block
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
z4qL4dVwWyBOQnrh
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
