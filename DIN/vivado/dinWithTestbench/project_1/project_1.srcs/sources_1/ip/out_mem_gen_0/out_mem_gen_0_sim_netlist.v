// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sat May  7 20:12:50 2022
// Host        : laptop-ycy running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/ycy/Desktop/ODIN/test_ODIN/test_ODIN/test_ODIN.srcs/sources_1/ip/out_mem_gen_0/out_mem_gen_0_sim_netlist.v
// Design      : out_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu9eg-ffvb1156-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "out_mem_gen_0,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module out_mem_gen_0
   (clka,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [3:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [7:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [7:0]douta;

  wire [3:0]addra;
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
  wire [3:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "4" *) 
  (* C_ADDRB_WIDTH = "4" *) 
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
  (* C_INIT_FILE = "out_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "16" *) 
  (* C_READ_DEPTH_B = "16" *) 
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
  (* C_WRITE_DEPTH_A = "16" *) 
  (* C_WRITE_DEPTH_B = "16" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "zynquplus" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  out_mem_gen_0_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0}),
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
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[3:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[3:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 21872)
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
