----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.08.2020 17:21:27
-- Design Name: 
-- Module Name: mod_m_count - Behavioral
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
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mod_m_count is
   generic (
            N: integer := 9;
            M: integer := 356
            );
  Port (
        clk, rst: in std_logic;
        max_tick: out std_logic;
        q: out std_logic_vector(N-1 downto 0)
         );
end mod_m_count;

architecture Behavioral of mod_m_count is
signal r_reg: unsigned(N-1 downto 0);
signal r_nxt: unsigned(N-1 downto 0);

begin
-- clock process
process(rst, clk)
begin
    if( rst = '1') then 
       r_reg <= (others => '0');
    elsif rising_edge(clk) then
        r_reg <= r_nxt;
    end if;
    end process;
-- stat next
 -- next-state logic
 r_nxt <= (others=>'0') when r_reg=(M-1) else
          r_reg + 1;
  -- output logic
  q <= std_logic_vector(r_reg);
  max_tick <= '1' when r_reg=(M-1) else '0';

end Behavioral;
