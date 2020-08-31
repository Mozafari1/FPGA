
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity counter is
    Port ( din : in STD_LOGIC_VECTOR (3 downto 0);
           zero : out STD_LOGIC;
           q : out STD_LOGIC_VECTOR (3 downto 0);
           clk, rst : in STD_LOGIC;
           load : in STD_LOGIC;
           decr : in STD_LOGIC);
end counter;

architecture Behavioral of counter is
signal reg, nxt: std_logic_vector(3 downto 0);
begin
-- state register
process (clk, rst)
begin
   if (rst = '1') then
	  reg <= (others=>'0'); -- 
	     elsif rising_edge(clk) then
	  reg <= nxt;
   end if;
end process;

-- next-state logic
nxt <=  din when load='1' else
        std_logic_vector(unsigned(reg)-1) when decr='1' else
        reg;
zero <= '1' when reg="0000" else '0';
q <= reg;

end Behavioral;
