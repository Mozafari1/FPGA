----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.08.2020 16:12:30
-- Design Name: 
-- Module Name: add4bit_tb - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity add4bit_tb is
--  Port ( );
end add4bit_tb;

architecture Behavioral of add4bit_tb is
component add4bit is
    PORT( 
        opA, opB: in std_logic_vector(3 downto 0);
        resC: out std_logic_vector(4 downto 0)
        
        );
end component;
signal a,b: std_logic_vector(3 downto 0);
signal rc: std_logic_vector(4 downto 0);
begin
ut: entity work.add4bit port map( opA => a, opB =>b, resC => rc);

process
    begin
        a <= "0000";
        b <= "0000";
        wait for 10 ns;
        a <= "0001";
        b <= "0001";
        wait for 10 ns;
        a <= "0010";
        b <= "0010";
        wait for 10 ns;
        a <= "0011";
        b <= "0011";
        wait for 10 ns;
        a <= "0100";
        b <= "0100";
        wait for 10 ns;
        a <= "0101";
        b <= "0101";
        wait for 10 ns;
        a <= "0110";
        b <= "0110";
        wait for 10 ns;
        a <= "0111";
        b <= "0111";
        wait for 10 ns;
        a <= "1000";
        b <= "1000";
        wait for 10 ns;
        a <= "1001";
        b <= "1001";
        wait for 10 ns;
        a <= "1010";
        b <= "1010";
        wait for 10 ns;
        a <= "1011";
        b <= "1011";
        wait for 10 ns;
        a <= "1100";
        b <= "1100";
        wait for 10 ns;
        a <= "1101";
        b <= "1101";
        wait for 10 ns;
        a <= "1110";
        b <= "1110";
        wait for 10 ns;
        a <= "1111";
        b <= "1111";
        wait for 10 ns;
 end process;
end Behavioral;
