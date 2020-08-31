----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.08.2020 22:03:16
-- Design Name: 
-- Module Name: edice_tb - arch
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

entity edice_tb is
 -- Port ( );
end edice_tb;

architecture arch of edice_tb is
component edice
        port (clk, rst : in std_logic;
              cheat, run : in std_logic;
              R : in std_logic_vector(2 downto 0);
			  led : out std_logic_vector(7 downto 0)
			  );
    end component;

    signal clk, rst : std_logic;
    signal cheat, run : std_logic; -- module inputs
    signal R : std_logic_vector(2 downto 0);
	signal led : std_logic_vector(7 downto 0); -- module outputs

    constant clk_period : time := 10 ns;
begin

  uut : edice
  port map (clk => clk, rst => rst,
            cheat => cheat, run => run,
            R => R, led => led);

clk_process: process 
 begin
    clk <= '0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
 end process;
-- Stimuli process 
    stim_proc: process
       begin
          cheat <= '0';
          run <= '0';
          R <= "010"; -- triple prob for 2
          rst <= '1';      
          wait for clk_period;
          rst <= '0';      
          run <= '1';      
          wait for clk_period*10;
          cheat <= '1';
          wait for clk_period*10;
          cheat <= '0';
          wait for clk_period*10;
         
       end process ;
end arch;
