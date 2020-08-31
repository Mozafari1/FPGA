----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.08.2020 15:37:06
-- Design Name: 
-- Module Name: add4bit - Behavioral
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

entity add4bit is
  Port (
        opA, opB: in std_logic_vector(3 downto 0);
        resC: out std_logic_vector(4 downto 0)
       
       );
end add4bit;

architecture Behavioral of add4bit is
SIGNAL C2, C1, C0: std_logic;
begin
bit0: entity work.add1bit(Behavioral)
    PORT MAP(A => opA(0), B => opB(0), Cin =>'0', S => resC(0), Cout => C0);
bit1: entity work.add1bit(Behavioral)
    PORT MAP(A => opA(1), B => opB(1), Cin => C0, S => resC(1), Cout => C1);
bit2: entity work.add1bit(Behavioral)
    PORT MAP(A => opA(2), B => opB(2), Cin => C1, S => resC(2), Cout => C2);
bit3: entity work.add1bit(Behavioral)
    PORT MAP(A => opA(3), B => opB(3), Cin => C2, S => resC(3), Cout =>resC(4));
        

end Behavioral;
