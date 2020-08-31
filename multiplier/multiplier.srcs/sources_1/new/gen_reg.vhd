
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity gen_reg is
    Port ( din : in STD_LOGIC_VECTOR (7 downto 0);
           dout : out STD_LOGIC_VECTOR (7 downto 0);
           clk, rst : in STD_LOGIC;
           clear : in STD_LOGIC;
           update : in STD_LOGIC);
end gen_reg;

architecture Behavioral of gen_reg is
signal reg, nxt: std_logic_vector(7 downto 0);
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
nxt <=  din when update='1' else
        (others=>'0') when clear='1' else
        reg;
dout <= reg;

end Behavioral;
