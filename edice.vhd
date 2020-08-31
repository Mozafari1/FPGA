-- USN VHDL 101 course
-- template for FSM development
-- author | date

library ieee;
use ieee.std_logic_1164.all;

entity edice is
   port ( clk, rst, cheat, run: in std_logic;
          res: in std_logic_vector(2 downto 0);
          an: out std_logic_vector(3 downto 0);
          leds: out std_logic_vector(7 downto 0)
	    );
end edice;

architecture arch of edice is
type state is (S0, S1, S2,S3,S4,S5,S6, S7);
signal prest, nxtst: state;  -- present state, next state

begin
-- state register
process (clk, rst)
begin
   if (rst = '1') then
	  prest <= S0; -- initial state
   elsif rising_edge(clk) then
	  prest <= nxtst;
   end if;
end process;

-- next-state logic
process (prest, res, cheat, run)
begin
   nxtst <= prest; -- stay in current state by default

   case prest is
      when S0 =>
         if run='1' then nxtst <= S1;
         end if;
      when S1 =>
         if run='1' then nxtst <= S2;
         end if;
      when S2 =>
          if run='1' then nxtst <= S3;
         end if;
      when S3 =>
             if run='1' then nxtst <= S4;
            end if;
      when S4 =>
                if run='1' then nxtst <= S5;
               end if;
      when S5 =>
            if( run='1' and cheat ='0')or (run ='1' and cheat ='1' and (res ="000" or res ="111") )  then nxtst <= S0;
            elsif( run ='1' and cheat ='1' and (res /="000" and res/="111")) then nxtst <= S6;
            
            end if;
      when S6 =>
        if( run ='1') then nxtst <= S7;
        
      
        end if;
      when S7 =>
        if (run ='1') then nxtst <= S0;
        end if;
   end case;
end process;

-- Moore outputs logic
process (prest)
begin
   case prest is 
      when S0 =>  
         leds <= "10011111";
      when S1=>
         leds <= "00100101"; 
       when S2=>
         leds <= "00001101"; 
      when S3=>
         leds <= "10011001"; 
       when S4=>
         leds <= "01001001"; 
       when S5=>
         leds <= "01000001"; 
       when S6=>
         if res ="001" then leds <= "10011111"; 
         elsif res ="010" then leds <= "00100101";
          elsif res ="011" then leds <= "00001101";
           elsif res ="100" then leds <= "10011001";
            elsif res ="101" then leds <= "01001001";
            else
                leds <= "01000001";
            end if;
        when S7=>
                   if res ="001" then leds <= "10011111"; 
        elsif res ="010" then leds <= "00100101";
         elsif res ="011" then leds <= "00001101";
          elsif res ="100" then leds <= "10011001";
           elsif res ="101" then leds <= "01001001";
           else
               leds <= "01000001";
                       end if;                                                                   
   end case;
end process;

       an <= "0110";
-- this is writen by Rahmat in Nano terminal
end arch;





