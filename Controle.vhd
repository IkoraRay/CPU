LIBRARY ieee;
USE ieee.std_logic_signed.all;

ENTITY Controle IS
	PORT (
		clk			: IN	STD_LOGIC;
		instruction	: IN 	STD_LOGIC_VECTOR(15 DOWNTO 0);
		OPCode		: OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
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
			
		END IF;
	END PROCESS;
END Behavior;