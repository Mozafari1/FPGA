-----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.08.2020 13:25:24
-- Design Name: 
-- Module Name: uubc8bit_tb - Behavioral
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

entity uni8bitBC_tb is
--  Port ( );
end uni8bitBC_tb;

architecture Behavioral of uni8bitBC_tb is
constant N: integer := 8;
signal clk, rst, dir, clr, load, en : std_logic;
signal cin: std_logic_vector(N-1 downto 0);
signal cout: std_logic_vector(N-1 downto 0);
begin
uut: entity work.uni8bitBC(Behavioral)
    PORT MAP( c_in => cin, c_out => cout, clk => clk, rst => rst, clr => clr, load => load, en => en, dir => dir
    
    );
process
begin  
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;
    end process;
stim: process
begin
    cin <= "10110101";
    clr <= '0';
    load <= '0';
    rst <= '1';
    en <= '0';
    dir <= '0';
    wait for 50 ns;
    en <= '1';
    wait for 50 ns;
    rst <= '0';
    wait for 50 ns;
    load <= '1';
    wait for 50 ns;
    load <= '0';
    dir <= '1';
    wait for 50 ns;
    

end process;

end Behavioral;
