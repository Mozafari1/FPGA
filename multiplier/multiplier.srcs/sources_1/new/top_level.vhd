----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.08.2020 09:17:24
-- Design Name: 
-- Module Name: top_level - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_level is
  Port ( 
  clk, rst: in std_logic;
  din_A, din_B: in std_logic_vector(3 downto 0);
  dout: out std_logic_vector(7 downto 0)
  );
end top_level;

architecture Behavioral of top_level is
signal load, zero, decr: std_logic;
signal  psum, adder_out: std_logic_vector(7 downto 0);
signal clear,update1, update2: std_logic; 
begin

-- Counter
counter: entity work.counter(Behavioral) 
PORT MAP(
        clk => clk, rst => rst, din => din_B,
zero => zero, load => load,q => open,
 decr => decr
);
-- Adder
adder: entity work.adder(Behavioral) 
PORT MAP(
din1( 7 downto 4) =>"0000", din1 (3 downto 0)=> din_A,
         din2 => psum, dout => adder_out
        );
-- Gen reg1
gen_reg1: entity work.gen_reg(Behavioral) 
PORT MAP(
         clk => clk, rst => rst,din => adder_out,
          update => update1,
         clear => clear, dout => psum
         );
-- 2
gen_reg: entity work.gen_reg(Behavioral) 
PORT MAP(
         clk => clk, rst => rst,din => psum,
          update => update2,
         clear => '0', dout => dout
         );
-- CTR
ctr: entity work.ctr_path(arch) 
PORT MAP( clk => clk, rst => rst,
 zero => zero,clear => clear, decr => decr, 
 update1 => update1, update2 => update2, 
 load => load
    
);
end Behavioral;
