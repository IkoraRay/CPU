LIBRARY ieee;
USE ieee.std_logic_signed.all;

ENTITY Controle IS
	PORT (
		clk				: IN	STD_LOGIC;
		instruction		: IN 	STD_LOGIC_VECTOR(15 DOWNTO 0);
		state_if			: IN	STD_LOGIC;
		state_mem		: IN	STD_LOGIC;
		state_reg		: IN	STD_LOGIC;
		
		OPCode		: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		MemWrite		: OUT	STD_LOGIC;
		RegWrite		: OUT STD_LOGIC;
		Resetn		: OUT STD_LOGIC;
		PCWrite		: OUT STD_LOGIC
	);
END Controle;

ARCHITECTURE Behavior Of Controle IS
	SIGNAL operation:	STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
	PROCESS(clk)
	BEGIN
		IF Clock'EVENT AND Clock = '1' THEN
			operation <= instruction(15 DOWNTO 12);
			
			CASE operation IS
					WHEN "0000" =>  OPCode <= "00";	-- ALTERAR VALORES CONFORME A ESPECIFICAÇÃO FEITA POR NÓS
					WHEN "1000" =>  OPCode <= "00";	
					WHEN "0001" =>  OPCode <= "01";						
					WHEN "1001" =>  OPCode <= "01";
					WHEN "0010" =>  OPCode <= "10";
					WHEN "1010" =>  OPCode <= "10";
					WHEN "0011" =>  OPCode <= "11";
					WHEN "1011" =>  OPCode <= "11";
					WHEN OTHERS =>  OPCode <= "XX";						
			END CASE;
			
			Resetn 	<= '0';		
			
			IF state_if = '1' THEN
				PCWrite <= '1';
				
			ELSE
				PCWrite <= '0';
				
			END IF;
				
			if state_mem = '1' THEN
				MemWrite <= '1';
				
			ELSE
				MemWrite <= '0';
				
			END IF;
				
			if state_reg = '1' THEN
				RegWrite <= '1';
				
			ELSE
				RegWrite <= '0';
				
			END IF;
			
		END IF;
	END PROCESS;
END Behavior;