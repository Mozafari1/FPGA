----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.08.2020 10:20:44
-- Design Name: 
-- Module Name: ff - Behavioral
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
use ieee. numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ff is
  Port (clk, rst: in std_logic;
        q: out std_logic_vector(7 downto 0)
     );
end ff;

architecture Behavioral of ff is
signal cin, cout: unsigned(8 downto 0);
begin
process(clk)
    begin

    if rising_edge(clk) then
        cout   <= cin;
   
            end if;

     end process;
process(rst)
    begin
     if(rst ='0') then
        cin <= cout+1;
     else
        cin <= (others =>'0');
    end if;
 end process;
  
 q <= std_logic_vector(cout(7 downto 0));

end Behavioral;
