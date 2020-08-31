----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.08.2020 16:38:29
-- Design Name: 
-- Module Name: seqdec5bit - Behavioral
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

entity seqdec5bit is
  Port (    
        clk, rst, din: std_logic;
        dout: out std_logic
        );
end seqdec5bit;

architecture Behavioral of seqdec5bit is
type state is (s0, s1, s2, s4, s5);
signal st_pre, st_nxt: state;

begin
-- state register
process(clk, rst)
    begin
        if rst ='1' then
        st_pre <= s0;
        elsif rising_edge(clk) then
        st_pre <= st_nxt;
        end if;
        end process;
 -- state next
 
        

end Behavioral;
