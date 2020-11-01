LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY CACHE IS
	PORT (
		address_PC: IN STD_LOGIC_VECTOR (15 DOWNTO 0); -- converter e salvar em int_address
		address_mem: IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- converter e salvar em dada_address
		data_instruction :OUT STD_LOGIC_VECTOR (15 DOWNTO 0); 
		data_in: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		data_out: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		MemWrite, Clock, MemtoReg: IN STD_LOGIC
	);
END CACHE;
	
ARCHITECTURE Behavior OF CACHE IS
	TYPE instruction_array IS ARRAY (11 DOWNTO 0) of STD_LOGIC_VECTOR (15 DOWNTO 0);
	TYPE data_array is ARRAY (15 DOWNTO 0) of STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL int_address: INTEGER RANGE 0 TO 11;
	SIGNAL data_address: INTEGER RANGE 0 TO 15;
			
	CONSTANT instruction : instruction_array:= ("0000000000000000","0000000000000000","0000000000000000","0000000000000000",
										  "0000000000000000","0000000000000000","0000000000000000","0000000000000000");
			
	VARIABLE data: data_array:= ("0000000000000000","0000000000000000","0000000000000000","0000000000000000",
										  "0000000000000000","0000000000000000","0000000000000000","0000000000000000");
			
BEGIN
	
	int_address <= to_integer(signed(address_PC));
	data_address <= to_integer(signed(address_mem));
	
	
	PROCESS (Clock)
	BEGIN
		IF Clock'EVENT AND Clock = '1' THEN
			IF MemtoReg = '1' THEN
				data_out <= data(data_address);
					
			ELSIF MemWrite = '1' THEN 
				data(data_address) := data_in;
				
			ELSE 
				data_instruction <= instruction(int_address);
				
			END IF;
		END IF;
	END PROCESS;
	
END Behavior;