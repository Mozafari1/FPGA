-- USN VHDL 101 course
-- template for test bench development
-- author | date

library ieee;
use ieee.std_logic_1164.all;

entity edice_tb is
end edice_tb;

architecture tb of edice_tb is

    component edice
        port ( clk, rst, cheat, run: in std_logic;
              res: in std_logic_vector(2 downto 0);
              leds: out std_logic_vector(7 downto 0)
            );
    end component;

    signal clk, rst, cheat, run : std_logic;
	signal   res : std_logic_vector(2 downto 0); -- module inputs
	signal leds   : std_logic_vector(7 downto 0); -- module outputs

    constant clk_period : time := 10 ns;

begin

    uut : edice
    port map (clk => clk, rst => rst,
              cheat => cheat, run => run,
              leds => leds, res => res
              );

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
               res <= "010"; -- triple prob for 2
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

end tb;
