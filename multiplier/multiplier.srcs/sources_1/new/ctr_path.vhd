-- USN VHDL 101 course
-- template for FSM development
-- author | date

library ieee;
use ieee.std_logic_1164.all;

entity ctr_path is
   port ( clk, rst, zero: in std_logic;
          load, decr, clear, update1, update2: out std_logic
	    );
end ctr_path;

architecture arch of ctr_path is
type state is (S0, S1);
signal state_reg, state_nxt: state;  

begin
-- state register
process (clk, rst)
begin
   if (rst = '1') then
	  state_reg <= S0; -- initial state
   elsif rising_edge(clk) then
	  state_reg <= state_nxt;
   end if;
end process;

-- next-state logic
process (state_reg, zero)
begin
   state_nxt <= state_reg; -- stay in current state by default
   load <= '0';
   decr <= '0';
   clear <= '0';
   update1 <= '0';
   update2 <= '0';

   case state_reg is
      when S0 =>
         load <= '1';
         clear <= '1';
         state_nxt <= S1;
      when S1 =>
         if(zero='1') then
            update2 <= '1';
            state_nxt <= S0;
         else
            update1 <= '1';
            decr <= '1';
         end if;
   end case;
end process;

end arch;
