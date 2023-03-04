-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
-- Date        : Sun Oct 30 20:49:46 2022
-- Host        : LAPTOP-07KLTU7T running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/Vivado_project/test_ODIN5_9/project_1/project_1.srcs/sources_1/ip/SPI_mem_gen_0/SPI_mem_gen_0_stub.vhdl
-- Design      : SPI_mem_gen_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu9eg-ffvb1156-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SPI_mem_gen_0 is
  Port ( 
    a : in STD_LOGIC_VECTOR ( 10 downto 0 );
    qspo_ce : in STD_LOGIC;
    spo : out STD_LOGIC_VECTOR ( 0 to 0 )
  );

end SPI_mem_gen_0;

architecture stub of SPI_mem_gen_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "a[10:0],qspo_ce,spo[0:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "dist_mem_gen_v8_0_13,Vivado 2021.1";
begin
end;
