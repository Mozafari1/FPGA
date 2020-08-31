library ieee;
USE ieee.std_logic_1164.ALL; 

ENTITY dec2to4_tb IS 
END dec2to4_tb;

ARCHITECTURE behavior OF dec2to4_tb IS

-- Component Declaration for the Unit Under Test (UUT)

COMPONENT dec2to4
PORT( 
    in1, in0, en: in STD_LOGIC;
    out3, out2, out1, out0: out STD_LOGIC
); 
END COMPONENT;

signal in1, in0, en: std_logic; -- module inputs
signal out3, out2, out1, out0: std_logic; -- module outputs

BEGIN
    -- Instantiate the Unit Under Test (UUT) 
    uut: dec2to4 PORT MAP (
        in1 => in1, in0 => in0, en => en,
        out3 => out3, out2 => out2 , out1 => out1 , out0 => out0
    );

-- Stimulus process 
stim: process
begin 
    en  <= '0';
    in1 <= '0';
    in0 <= '0';
    wait for 20 ns;

    
    en <= '0';
    in1 <= '0'; 
    in0  <= '1';
    wait for 20 ns;

    en <= '0'; 
    in1 <= '1';
    in0 <= '0';
    wait for 20 ns;
    
    
    in1 <= '1';
    in0 <= '1';
    wait for 20 ns;

    en <= '1';
    
    in1 <= '0';
    in0 <= '0'; 
    wait for 20 ns; -- 4
    
    en <= '1';
    in1 <= '0';
    in0 <= '1'; 
    wait for 20 ns;
    en <= '1';
    in1 <= '1';
    in0 <= '0'; 
    wait for 20 ns;
    en <= '1';
    in1 <= '1';
    in0 <= '1'; 
    wait for 50 ns;

end process; 
END;