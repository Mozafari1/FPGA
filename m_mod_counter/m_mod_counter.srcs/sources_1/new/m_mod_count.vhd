----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.08.2020 14:44:55
-- Design Name: 
-- Module Name: m_mod_count - Behavioral
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
use IEEE.NUMERIC_STD.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity m_mod_count is
   generic(
            N: integer :=4; -- number of bits
            M: integer := 100 -- mod-M
            );
  Port (
        clk, rst: in std_logic;
        max_tick: out std_logic;
        q: out std_logic_vector(N-1 downto 0)
        );
end m_mod_count;

architecture Behavioral of m_mod_count is
SIGNAL r_reg: unsigned(N-1 downto 0);
SIGNAL r_nxt: unsigned(N-1 downto 0);
begin
-- Register
process( clk, rst)
    begin
        if(rst='1') then
            r_reg <= (others =>'0');
            elsif (clk'event and clk ='1') then
                r_reg <= r_nxt;
        end if;
end process;
-- Next state logic
r_nxt   <= (others => '0') when r_reg =(M-1) else
    r_reg +1;

-- Output logic
q <= std_logic_vector(r_reg);
max_tick    <= '1' when r_reg   = (M-1) else '0';


end Behavioral;
