-- USN VHDL 101 course
-- 2 to 4 decoder with enable input
-- outputs are active high

library ieee;
use ieee.std_logic_1164.all;

entity dec2to4 is
       Port ( in1, in0, en: in STD_LOGIC;
              out3, out2, out1, out0: out STD_LOGIC
             );
end dec2to4;

architecture if_arch of dec2to4 is
begin
   process (in1,in0)
      begin
         if en='0' then
            out3 <='0'; out2 <='0'; out1 <='0'; out0 <='0';
         elsif (in1='0' and in0='0') then
            out3 <='0'; out2 <='0'; out1 <='0'; out0 <='1';
         elsif (in1='0' and in0='1') then
            out3 <='0'; out2 <='0'; out1 <='1'; out0 <='0';
         elsif (in1='1' and in0='0') then
            out3 <='0'; out2 <='1'; out1 <='0'; out0 <='0';
         else
            out3 <='1'; out2 <='0'; out1 <='0'; out0 <='0';
         end if;
    end process;
end if_arch;
