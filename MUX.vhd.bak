LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY MUX IS
		PORT(
				X,Y: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
				Z: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
				S, Clock: STD_LOGIC
				);
				END MUX;
				
		ARCHITECTURE Behavior OF MUX IS
				BEGIN
					PROCESS (Clock)
						BEGIN
							IF Clock'EVENT AND Clock = '1' THEN
								IF S = '0' THEN
									Z <= X;
								ELSE
									Z <= Y;
								END IF;
						END PROCESS;
					END Behavior;
					