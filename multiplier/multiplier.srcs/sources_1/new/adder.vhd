library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity adder is
    Port ( din1, din2 : in STD_LOGIC_VECTOR (7 downto 0);
           dout : out STD_LOGIC_VECTOR (7 downto 0) );
end adder;

architecture Behavioral of adder is
begin
dout <= std_logic_vector(unsigned(din1)+unsigned(din2));

end Behavioral;
