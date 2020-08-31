----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.08.2020 12:51:44
-- Design Name: 
-- Module Name: alu_tb - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu_tb is
  --PORT();
end alu_tb;


architecture Behavioral of alu_tb is
Component alu is
Port (
         A, B, ctr: in std_logic_vector(3 downto 0);
         result: out std_logic_vector(7 downto 0)
        );
end Component;
signal A, B, ctr: std_logic_vector(3 downto 0);
signal result: std_logic_vector(7 downto 0);
constant clk_period : time := 10 ns;
begin
ut: entity work.alu(Behavioral) PORT MAP(
    A => A, B => B, ctr => ctr, result => result);
stim: process
begin
    A <= "0110";
    B <= "0101";
    ctr <= "0000";
    wait for clk_period;
    ctr <= "0001";
    wait for clk_period;
    ctr <= "0010";
    wait for clk_period;
    ctr <= "0011";
    wait for clk_period;
    ctr <= "0100";
    wait for clk_period;
    ctr <= "0101";
    wait for clk_period;
    ctr <= "0110";
    wait for clk_period;
    ctr <= "0111";
    wait for clk_period;
    ctr <= "1000";
    wait for clk_period;
    ctr <= "1001";
    wait for clk_period;
    ctr <= "1010";
    wait for clk_period;
    ctr <= "1011";
    wait for clk_period;
    ctr <= "1100";
    wait for clk_period;
    ctr <= "1101";
    wait for clk_period;
    ctr <= "1111";
    wait for clk_period;
    end process;
end Behavioral;
