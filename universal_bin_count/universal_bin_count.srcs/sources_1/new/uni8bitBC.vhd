----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.08.2020 15:50:33
-- Design Name: 
-- Module Name: uni8bitBC - Behavioral
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

entity uni8bitBC is
generic(
        N: integer :=8
        );
  Port (
        clr, en, load, dir, clk, rst: std_logic;
        c_in: std_logic_vector(N-1 downto 0);
        c_out: out std_logic_vector(N-1 downto 0)
        );
end uni8bitBC;

architecture Behavioral of uni8bitBC is
signal ffin, ffout: unsigned(N-1 downto 0);

begin
-- state register section
process(clk, rst)
    begin
        if(rst ='1') then
        ffout <= (others =>'0');
        elsif( rising_edge(clk)) then
        ffout <= ffin;
        end if;
end process;
-- next state section
ffin <= (others =>'0') when clr ='1' else
ffout when en ='0' else
unsigned(c_in) when load ='1' else
ffout +1 when dir ='1' else
ffout -1;
-- out section more output
c_out   <= std_logic_vector(ffout);

            

end Behavioral;
