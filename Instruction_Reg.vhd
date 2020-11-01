LIBRARY ieee;
USE ieee.std_logic_signed.all;

ENTITY Instruction_Reg IS
	PORT (
			Mem_in: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			OPCode, Ri, Rj, Rk: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			Clockn, Mov_Cond: IN STD_LOGIC
			);
	END Instruction_Reg;
	
ARCHITECTURE Behavior OF Instruction_Reg IS
	BEGIN
			PROCESS(Clock)
			BEGIN
					IF Clock'EVENT AND Clock = '1' THEN
						IF Mov_Cond = '0'THEN
						
						OPCode <= Mem_in(15 DOWNTO 12);
						Ri <= Mem_in(11 DOWNTO 8);
						Rj <= Mem_in(7 DOWNTO 4);
						Rk <= Mem_in(3 DOWNTO 0);
						ELSE
						OPCode <= Mem_in(15 DOWNTO 12);
						Ri <= Mem_in(11 DOWNTO 8);
						Rj <= "0000";
						Rk <= Mem_in(3 DOWNTO 0);
					END IF;
				END IF;
			END PROCESS;
	END Behavior;
						
			