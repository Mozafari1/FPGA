----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.08.2020 09:37:18
-- Design Name: 
-- Module Name: exp - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity exp is
  Port ( 
    a, b: in std_logic_vector(1 downto 0);
    ctr: in std_logic_vector(1 downto 0);
    c: out std_logic_vector(2 downto 0)
  );
end exp;

architecture Behavioral of exp is
signal ua, ub: unsigned(1 downto 0);
signal uc: unsigned( 2 downto 0);
begin
ua <= unsigned('0' & a);
ub <= unsigned('0' & b);
uc <=  (ua + ub) when ctr = "00"else
     (ua - ub) when ctr = "01" else
     ua* ub;
     

 c <=   std_logic_vector(uc);

        

end Behavioral;
