----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.08.2020 21:04:46
-- Design Name: 
-- Module Name: ubc8bit - Behavioral
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

entity ubc8bit is
  generic (
           N: integer := 8
           );
  Port (
        clr, rst, dir, load, clk, en: std_logic;
        cin: std_logic_vector(N-1 downto 0);
        cout : out std_logic_vector(N-1 downto 0)
   );
end ubc8bit;

architecture Behavioral of ubc8bit is
signal ffin, ffout: unsigned(N-1 downto 0);
begin
process(clk, rst )
    begin
        if (rst ='1') then
        ffout <= (others => '0');
        elsif(rising_edge(clk) )then
        ffout <= ffin;
        end if;
end process;

-- next state
process(clr, ffin, ffout, en, dir, load, cin)
begin
 if clr = '1' then ffin <= (others =>'0');
 elsif (en ='0') then ffin <= ffout;
 elsif (load ='1') then ffin <= unsigned(cin);
 elsif dir = '1' then ffin <= ffout +1;
 else   ffin <= ffout - 1;
 end if;
 end process;
 
cout <= std_logic_vector(ffout);
end Behavioral;
