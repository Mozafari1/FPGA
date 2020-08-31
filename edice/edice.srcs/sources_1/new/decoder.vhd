----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.08.2020 10:20:53
-- Design Name: 
-- Module Name: decoder - Behavioral
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

entity decoder is
  Port ( result: in std_logic_vector(2 downto 0);
        dig: out std_logic_vector(3 downto 0);
        segs, leds: out std_logic_vector(6 downto 0)
        );
end decoder;

architecture Behavioral of decoder is
signal res: unsigned(2 downto 0);
signal d: unsigned(3 downto 0);
signal seg, led: unsigned( 6 downto 0);
begin

res   <= unsigned(result);
process(res)
begin
    if res = "000" then led <= "1111001";
    
    end if;
end process;
end Behavioral;
