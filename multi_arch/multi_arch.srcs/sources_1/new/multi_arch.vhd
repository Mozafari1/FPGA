----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.08.2020 15:06:04
-- Design Name: 
-- Module Name: multi_arch - Behavioral
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

entity multi_arch is
  Port ( 
        inA, inB, en: in std_logic;
        out0, out1, out2, out3: out std_logic
        );
end multi_arch;




architecture selxct of multi_arch is
-- define signal
signal sel: std_logic_vector(2 downto 0);
begin
sel <= inA & inB & en;
with sel select
out0 <= '1' when "100", '0' when others;
with sel select
out1 <= '1' when "101", '0' when others;
with sel select
out2 <= '1' when "110", '0' when others;
with sel select
out3 <= '1' when "111", '0' when others;
end selxct;





architecture dataFlow of multi_arch is

begin
process(inA, inB, en)
begin
out0 <= en AND (NOT inA) AND (NOT inB);
out1 <= en AND inA AND (NOT inB);
out2 <= en AND (NOT inA) AND inB;
out3 <= en AND inA AND inB;
end process;
end dataFlow;

architecture behavioral of multi_arch is
begin

process(inA, inB, en) 
    begin
        if (en= '0') then
            out0 <='0'; out1 <='0'; out2 <= '0'; out3 <= '0';
        elsif( inA ='0' and inB ='0') then
             out0 <='1'; out1 <='0'; out2 <= '0'; out3 <= '0';
        elsif(inA ='1' and inB ='0') then
             out0 <='0'; out1 <='1'; out2 <= '0'; out3 <= '0';
        elsif(inA ='0' and inB='1') then
             out0 <='0'; out1 <='0'; out2 <= '1'; out3 <= '0';
        else
             out0 <='0'; out1 <='0'; out2 <= '0'; out3 <= '1';
end if;
end process;
end behavioral;
architecture behB of multi_arch is

begin
out0 <= '1' when(en ='1' and inA ='0' and inB ='0') else '0';
out1 <= '1' when(en ='1' and inA ='1' and inB ='0') else '0';
out2 <= '1' when(en ='1' and inA ='0' and inB ='1') else '0';
out3 <= '1' when(en ='1' and inA ='1' and inB ='1') else '0';
end behB;
architecture dataF of multi_arch is
begin

out0 <= (en AND (NOT inB)) AND (NOT inA);
out1 <= (en AND (NOT inB)) AND inA;
out2 <= (en AND inB) AND (NOT inA);
out3 <= (en AND inA) AND inB;


end dataF;
