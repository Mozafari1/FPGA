----------------------------------------------------------------------------------
-- Top design module 
----------------------------------------------------------------------------------
library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;

entity top_module is
    port ( 
        clk, rst, ...: in std_logic;
		din: in std_logic_vector(7 downto 0);
        dout1, dout2, ...: out std_logic;
        dout:   out std_logic_vector(7 downto 0)
        );
end top_module;

architecture arch of top_module is
    signal ...: std_logic;  
    signal ...: std_logic_vector(7 downto 0);

----------------------------------------------------------------------------------
begin

-- module 1
    module1: entity work.module1(arch)
        port map (  clk=>clk, rst=>rst, ... );

-- module 2 
    module2: entity work.module2(arch)
        port map (  clk=>clk, rst=>rst, ... );
					
-- module 3
    module3: entity work.module3(arch)
        port map (  clk=>clk, rst=>rst, ... );

-- other statements at the top level
... <= ...;
    
end arch;