LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY Controle IS
	PORT (
		instruction		:IN 	STD_LOGIC_VECTOR(3 DOWNTO 0);
		Resetn, Clock		:IN STD_LOGIC;
		
		ALUOp		: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		MemWrite		: OUT	STD_LOGIC;
		MemtoReg		: OUT STD_LOGIC;
		RegWrite		: OUT STD_LOGIC;
		RegDst		: OUT STD_LOGIC;
		PCWrite		: OUT STD_LOGIC;
		Cin         : OUT STD_LOGIC;
		ALUSourceB  : OUT STD_LOGIC;
		Mov_Cond		: OUT STD_LOGIC
		
	);
END Controle;

ARCHITECTURE Behavior Of Controle IS
		SIGNAL States: STD_LOGIC_VECTOR(3 DOWNTO 0);
		-- 0- fetch
		-- 1- decode
		-- 2- type-R(1)
		-- 3- type-R(2)
		-- 4- type-I
		-- 5- MOV
		
BEGIN
	PROCESS(Clock)
	BEGIN
		IF Clock'EVENT AND Clock = '1' THEN
			IF Resetn = '0' THEN
				States <= "0000";
			END IF;
			
			CASE States IS
				WHEN "0000" =>
					ALUSourceB <= '0';
					PCWrite <= '1';
					States <= "0001";
					
				WHEN "0001" =>
					PCWrite <= '0';
					IF instruction = "0000" THEN
						Mov_Cond <= '1';
						ALUSourceB <= '0';
						States <= "0010";
					
					ELSIF instruction = "1000" THEN
						Mov_Cond <= '1';
						ALUSourceB <= '1';
						States <= "0100";
					
					ELSIF instruction = "0001" THEN
						Mov_Cond <= '0';
						ALUSourceB <= '0';
						States <= "0010";
						
					ELSIF instruction = "1001"THEN
						Mov_Cond <= '0';
						ALUSourceB <= '1';
						States <= "0100";
						
					ELSIF instruction = "0010" THEN
						Mov_Cond <= '0';
						Cin <= '1';
						ALUSourceB <= '0';
						States <= "0010";
					
					ELSIF instruction = "1010" THEN
						Mov_Cond <= '0';
						Cin <= '1';
						ALUSourceB <= '1';
						States <= "0100";
					
					ELSIF instruction = "0011" THEN
						Mov_Cond <= '0';
						ALUSourceB <= '0';
						States <= "0010";
						
					ELSIF instruction = "1011" THEN
						Mov_Cond <= '0';
						ALUSourceB <= '1';
						States <= "0100";
						
					ELSIF instruction = "0100" THEN
						Mov_Cond <= '0';
						ALUSourceB <= '0';
						States <= "0010";
						
					ELSIF	instruction = "1100" THEN
						Mov_Cond <= '0';
						ALUSourceB <= '1';
						States <= "0010";
					ELSE
						States <= "0000";
					
					--ELSIF instruction = "1101" THEN
					--	Mov_Cond <= '0';
						
					END IF;
					
				
				WHEN "0010" =>
				
					CASE instruction IS
						WHEN "0000" =>  ALUOp <= "00";		
						WHEN "0001" =>  ALUOp <= "00";						
						WHEN "0010" =>  ALUOp <= "01";					 					 
						WHEN "0011" =>  ALUOp <= "10";
						WHEN OTHERS =>  ALUOp <= "11";						
					END CASE;
					States <= "0011";
					
				WHEN "0011"=>
				
					MemtoReg <= '0';
					RegWrite <= '1';
					RegDst <= '0';
					States <= "0000";
				WHEN "0100"=>
				
					CASE instruction IS
						
						WHEN "1000" =>  ALUOp <= "00";							
						WHEN "1001" =>  ALUOp <= "00";					 
						WHEN "1010" =>  ALUOp <= "01";					 
						WHEN "1011" =>  ALUOp <= "10";
						WHEN OTHERS =>  ALUOp <= "11";						
					END CASE;
					States <= "0011";	
					
			END CASE;
		END IF;
	END PROCESS;
END Behavior;