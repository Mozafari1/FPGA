----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.08.2020 14:42:12
-- Design Name: 
-- Module Name: add1bit - Behavioral
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

entity add1bit is
  Port ( 
        Cin, A, B: in std_logic;
        S, Cout: out std_logic
       );
end add1bit;

architecture Behavioral of add1bit is

begin
    Cout <= (A AND B) OR (B AND Cin) OR (A AND Cin);
         
    S   <= ((NOT Cin) AND (NOT A) AND B)
        OR ((NOT Cin) AND A AND (NOT B))
        OR (Cin AND (NOT A) AND (NOT B))
        OR (Cin AND A AND B);
        
end Behavioral;
