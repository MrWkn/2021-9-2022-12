// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Wed Apr 27 09:11:58 2022
// Host        : laptop-ycy running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               e:/EDAproject/test/test_ODIN/test_ODIN.srcs/sources_1/ip/neuron_mem_0/neuron_mem_0_stub.v
// Design      : neuron_mem_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu9eg-ffvb1156-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2020.2" *)
module neuron_mem_0(a, d, clk, we, i_ce, spo)
/* synthesis syn_black_box black_box_pad_pin="a[7:0],d[127:0],clk,we,i_ce,spo[127:0]" */;
  input [7:0]a;
  input [127:0]d;
  input clk;
  input we;
  input i_ce;
  output [127:0]spo;
endmodule
