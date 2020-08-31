----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.08.2020 21:09:46
-- Design Name: 
-- Module Name: alu - Behavioral
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
use Ieee.math_real.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
-- There are no differences between these two architectural descriptions and Vivado will generate the same generic representation for when/else and if/then/elsif statements

entity alu is
  Port ( 
        A, B,ctr: in std_logic_vector(3 downto 0);
        result: out std_logic_vector(7 downto 0)
        );
end alu;
--------------------------------------------

architecture arch of alu is

-- USING IF/ THEN / ELSIF STATEMENT
signal uA, uB: unsigned(4 downto 0);
signal ures2: unsigned(9 downto 0);
begin
    uA <= unsigned('0' & A);
    uB <= unsigned('0' & B);
process(uA, uB, ctr)
    begin
        if ctr ="0000" then ures2 <= "00000" & (uA +uB);
        elsif ctr = "0001" then ures2 <= "00000" &(uA -uB);
        elsif ctr = "0010" then ures2 <= uA *uB;
        elsif ctr = "0011" then ures2 <= "00000" &(uA / uB) ;
        elsif ctr = "0100" then ures2 <= "00000" &(uA mod uB);
        elsif ctr = "0101" then ures2 <= "00000" & ('0' & uA (4 downto 1));
        elsif ctr = "0110" then ures2 <= "00000" & (uA(3 downto 0) & '0');
        elsif ctr = "0111" then ures2 <= "00000" &('0' & uB(4 downto 1));
        elsif ctr = "1000" then ures2 <= "00000" & (uB(3 downto 0) & '0');
        elsif ctr = "1001" then ures2 <= "00000" &(uB ror to_integer(uA) ); -- ROR
        elsif ctr = "1010" then ures2 <= "00000" &(uA rol to_integer(uB));  -- ROL
        elsif ctr = "1011" then ures2 <= ((uA + uB) *uA /(uA+uB));
        elsif ctr = "1100" then ures2 <= "00000" &(uA XOR uB);
        elsif ctr = "1101" then ures2 <= "00000" &(uA NOR uB);
        elsif ctr = "1110" then ures2 <= "00000" &(uA XNOR uB);
        else ures2 <= "00000" &(uA NAND uB); 
        end if;
        end process;
        result <= std_logic_vector(ures2(7 downto 0));
end arch;

-- using WHEN / ELSE STATEMENT

architecture Behavioral of alu is
signal uA, uB: unsigned(4 downto 0);
signal ures: unsigned(9 downto 0);
begin
uA <= unsigned('0' & A);
uB <= unsigned('0' & B);
ures <= 
        -- arithmetic operations
        "00000" & (uA +uB) when ctr ="0000" else        -- add
        "00000" & (uA - uB) when ctr ="0001" else       -- sub
        uA * uB when ctr ="0010" else                  -- multi
        "00000" & uA / uB when ctr = "0011" else        -- divi
        "00000" & (uA mod uB) when ctr = "0100" else    -- mod  
        --((uA + uB) *uA /(uA+uB))    when ctr ="0101" else -- 
        uA * uA when ctr ="0101" else                   -- square of A
        --"00000" &(uA rem uB) when ctr ="1011" else    -- rem
         
         -- logic operations      
        "00000" & ('0' & uA (4 downto 1)) when ctr ="0110" else   -- shift A right 
        "00000" & (uA(3 downto 0) & '0')when ctr ="0111" else       -- shift A left 
        "00000" & ('0' & uB (4 downto 1)) when ctr ="1000" else   -- shift B right 
        "00000" & (uB ( 3 downto 0) & '0')when ctr = "1001" else  -- shift B left      
        "00000" & (uB ROR to_integer(uA)) when ctr ="1010" else    -- Rotate A right 
        "00000" & (uA ROL to_integer(uB)) when ctr ="1011" else    -- Rotate B left 
        "00000" & (uA XOR uB) when ctr = "1100" else    -- XOR
        "00000" & (uA NOR uB) when ctr = "1101" else    -- NOR
        "00000" & (uA XNOR uB) when ctr = "1110" else   -- XNOR
        "00000" &(uA NAND uB);
        
result <= std_logic_vector(ures(7 downto 0));

end Behavioral;