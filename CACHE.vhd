LIBRARY ieee;
USE ieee.std_logic_1164.all;


	
ENTITY CACHE IS
	PORT (
			address_PC: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			address_mem: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			data_instruction :OUT STD_LOGIC_VECTOR (15 DOWNTO 0); 
			data_in: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			data_out: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
			MemWrite, Clock, PCWrite: IN STD_LOGIC
			);
			END ENTITY;
	
ARCHITECTURE Behavior OF CACHE IS
			TYPE instruction_array IS ARRAY (11 DOWNTO 0) of STD_LOGIC_VECTOR (15 DOWNTO 0);
			TYPE data_array is ARRAY (15 DOWNTO 0) of STD_LOGIC_VECTOR (7 DOWNTO 0);
			SIGNAL int_address: INTEGER RANGE 0 TO 11;
			SIGNAL data_address: INTEGER RANGE 0 TO 15;
			
			CONSTANT instruction : instruction_array:= ();
			
			VARIABLE data: data_array:= ();
			
			BEGIN
				PROCESS (Clock)
				BEGIN
					IF Clock'EVENT AND Clock = '1' THEN
						IF MemWrite = '0' AND PCWrite = '0' THEN
						data_out <= data(data_address);
						ELSIF MemWrite = '1' AND PCWrite = '0' THEN 
						data(data_address) <= data_in;
						ELSE 
						data_instruction <= instruction(int_address);
						
						END IF;
					END IF;
					END PROCESS;
			
			END Behavior;