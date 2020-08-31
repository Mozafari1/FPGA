LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY counter_tb is
end counter_tb;
ARCHITECTURE behavior OF counter_tb is 
-- Component declaration for the unit under test

COMPONENT counter is 
port (
     clk, reset, en, direction: in std_logic;
     count_out: out std_logic_vector(3 downto 0)
     );
END COMPONENT;

-- INPUTS

signal clk, en, direction: std_logic :='0';
signal reset : std_logic :='1';
 
-- Outputs
signal count_out: std_logic_vector(3 downto 0);

--Clock period def
constant clk_period  :time := 10 ns;

BEGIN
-- instantiate the UUT
uut : counter port map(
clk => clk, reset => reset, en => en, direction => direction, count_out => count_out
);

-- clock process
process
 begin
 clk <= '0';
 wait for clk_period/2;
 clk <= '1';
 wait for clk_period/2;
 end process;
 
-- Stimulus process
stim: process
begin
    reset <= '1';
    en <= '0';
    -- holding reset state for 100 ns
    wait for  100 ns;
    reset <= '0';
    -- enabling counter for 200 ns after reset
    wait for clk_period *20;
    en <= '1';
    -- inserting stimulus here
    DIRECTION <= '1' after 100 ns;
    wait;
    end process;
   end;
   