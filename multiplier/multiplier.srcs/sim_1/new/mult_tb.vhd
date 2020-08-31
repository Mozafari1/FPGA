----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.08.2020 10:25:42
-- Design Name: 
-- Module Name: mult_tb - Behavioral
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

entity mult_tb is
end mult_tb;

architecture Behavioral of mult_tb is
signal clk, rst: std_logic;
signal din_A, din_B: std_logic_vector(3 downto 0);
signal dout: std_logic_vector(7 downto 0);
begin
uut: entity work.top_level(Behavioral)
    PORT MAP(
            clk => clk, rst => rst,
             din_A => din_A, din_B => din_B, 
             dout => dout
            );

-- clock process
process 
 begin
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
 end process;
-- Stimuli process 
    stim_proc: process
       begin
        din_A <= "0011";
        din_B <= "0110";
        rst <= '1';
        wait for 10 ns;
        rst <= '0';
        wait for 500 ns;

                         
       end process ;
end Behavioral;
