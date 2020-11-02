LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY Extensor IS
	PORT(
			I :IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			O :OUT  STD_LOGIC_VECTOR (7 DOWNTO 0)
			);
		END Extensor;

ARCHITECTURE Behavior OF Extensor IS
		SIGNAL sinal: STD_LOGIC;
BEGIN 
		sinal <= I(3 DOWNTO 3);
		
		IF sinal = '0' THEN
			O <= "0000" & I;
		ELSE
			O <= "1111" & I; 
		END IF;
		
END Behavior;
		