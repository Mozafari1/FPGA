----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.08.2020 14:12:10
-- Design Name: 
-- Module Name: m_mod_count_tb - Behavioral
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
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity m_mod_count_tb is
--  Port ( );
end m_mod_count_tb;

architecture Behavioral of m_mod_count_tb is
constant clk_period : time := 10 ns;
constant N: integer := 4;
constant M: integer := 100;

component m_mod_count is 
   
  Port (
      clk, rst: in std_logic;
      max_tick: out std_logic;
      q: out std_logic_vector(N-1 downto 0)
      );
end component;
signal clk, rst, max_tick: std_logic;
signal q: std_logic_vector(N-1 downto 0);

begin
uut: entity work.m_mod_count(Behavioral) PORT MAP(
        clk => clk, rst => rst, max_tick=> max_tick, q => q
        );
 process
               begin
               
               clk<= '0';
               wait for clk_period/2;
               clk<='1';
               wait for clk_period/2;
           end process;  
stim: process
    begin
    rst <='1';
    
    wait for clk_period;
    rst <= '0';
    wait for clk_period*20;
    end process;
  

end Behavioral;
