LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY PC IS
	PORT (
		END_IN			: 	IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		END_OUT			: 	OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		Clock, PCWrite : 	IN STD_LOGIC
	);
END PC;

ARCHITECTURE Behavior OF PC IS
BEGIN
	--Caso não funcione, adicionar signal
	PROCESS (Clock, PCWrite)
	BEGIN
		IF Clock'EVENT AND PCWrite = '1' THEN
			END_OUT <= END_IN;
		END IF;
	END PROCESS;
END Behavior;				
			