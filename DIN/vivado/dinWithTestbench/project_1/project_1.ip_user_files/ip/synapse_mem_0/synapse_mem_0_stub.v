// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Mon Jan  2 10:57:53 2023
// Host        : LAPTOP-07KLTU7T running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/Vivado_project/test_ODIN5_9/project_1/project_1.srcs/sources_1/ip/synapse_mem_0/synapse_mem_0_stub.v
// Design      : synapse_mem_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu9eg-ffvb1156-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2021.1" *)
module synapse_mem_0(a, d, clk, we, i_ce, spo)
/* synthesis syn_black_box black_box_pad_pin="a[12:0],d[31:0],clk,we,i_ce,spo[31:0]" */;
  input [12:0]a;
  input [31:0]d;
  input clk;
  input we;
  input i_ce;
  output [31:0]spo;
endmodule
