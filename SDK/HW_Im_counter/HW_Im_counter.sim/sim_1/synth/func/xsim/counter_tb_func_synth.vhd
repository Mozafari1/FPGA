-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Mon Aug 31 11:12:03 2020
-- Host        : 01010101010101010 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               C:/Users/m_rah/Desktop/SDK/HW_Im_counter/HW_Im_counter.sim/sim_1/synth/func/xsim/counter_tb_func_synth.vhd
-- Design      : counter
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity counter is
  port (
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    en : in STD_LOGIC;
    direction : in STD_LOGIC;
    count_out : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of counter : entity is true;
end counter;

architecture STRUCTURE of counter is
  signal clk_IBUF : STD_LOGIC;
  signal clk_IBUF_BUFG : STD_LOGIC;
  signal count_int : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal count_out_OBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal direction_IBUF : STD_LOGIC;
  signal en_IBUF : STD_LOGIC;
  signal reset_IBUF : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count_int[0]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \count_int[1]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \count_int[2]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \count_int[3]_i_1\ : label is "soft_lutpair0";
begin
clk_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => clk_IBUF,
      O => clk_IBUF_BUFG
    );
clk_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => clk,
      O => clk_IBUF
    );
\count_int[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_out_OBUF(0),
      O => count_int(0)
    );
\count_int[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => count_out_OBUF(0),
      I1 => count_out_OBUF(1),
      I2 => direction_IBUF,
      O => count_int(1)
    );
\count_int[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"78E1"
    )
        port map (
      I0 => count_out_OBUF(0),
      I1 => count_out_OBUF(1),
      I2 => count_out_OBUF(2),
      I3 => direction_IBUF,
      O => count_int(2)
    );
\count_int[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7F80FE01"
    )
        port map (
      I0 => count_out_OBUF(1),
      I1 => count_out_OBUF(0),
      I2 => direction_IBUF,
      I3 => count_out_OBUF(3),
      I4 => count_out_OBUF(2),
      O => count_int(3)
    );
\count_int_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => count_int(0),
      Q => count_out_OBUF(0),
      R => reset_IBUF
    );
\count_int_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => count_int(1),
      Q => count_out_OBUF(1),
      R => reset_IBUF
    );
\count_int_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => count_int(2),
      Q => count_out_OBUF(2),
      R => reset_IBUF
    );
\count_int_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => en_IBUF,
      D => count_int(3),
      Q => count_out_OBUF(3),
      R => reset_IBUF
    );
\count_out_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => count_out_OBUF(0),
      O => count_out(0)
    );
\count_out_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => count_out_OBUF(1),
      O => count_out(1)
    );
\count_out_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => count_out_OBUF(2),
      O => count_out(2)
    );
\count_out_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => count_out_OBUF(3),
      O => count_out(3)
    );
direction_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => direction,
      O => direction_IBUF
    );
en_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => en,
      O => en_IBUF
    );
reset_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => reset,
      O => reset_IBUF
    );
end STRUCTURE;
