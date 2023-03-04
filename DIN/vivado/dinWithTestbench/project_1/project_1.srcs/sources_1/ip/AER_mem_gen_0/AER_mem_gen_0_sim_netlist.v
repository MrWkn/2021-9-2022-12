// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sat May  7 20:08:07 2022
// Host        : laptop-ycy running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top AER_mem_gen_0 -prefix
//               AER_mem_gen_0_ AER_mem_gen_0_sim_netlist.v
// Design      : AER_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu9eg-ffvb1156-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "AER_mem_gen_0,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module AER_mem_gen_0
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [3:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [15:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [15:0]douta;

  wire [3:0]addra;
  wire clka;
  wire [15:0]dina;
  wire [15:0]douta;
  wire ena;
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
  wire [15:0]NLW_U0_doutb_UNCONNECTED;
  wire [3:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [15:0]NLW_U0_s_axi_rdata_UNCONNECTED;
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.189618 mW" *) 
  (* C_FAMILY = "zynquplus" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
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
  (* C_INIT_FILE = "AER_mem_gen_0.mem" *) 
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
  (* C_READ_WIDTH_A = "16" *) 
  (* C_READ_WIDTH_B = "16" *) 
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
  (* C_WRITE_WIDTH_A = "16" *) 
  (* C_WRITE_WIDTH_B = "16" *) 
  (* C_XDEVICEFAMILY = "zynquplus" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  AER_mem_gen_0_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[15:0]),
        .eccpipece(1'b0),
        .ena(ena),
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
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[15:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 21520)
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
