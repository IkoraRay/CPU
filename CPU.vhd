LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY CPU IS
	PORT (
		Clock	:IN	STD_LOGIC
	);
END CPU;

ARCHITECTURE Behavior OF CPU IS 
	SIGNAL ALUOp		: 	STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL MemWrite	:	STD_LOGIC;
	SIGNAL RegWrite	:	STD_LOGIC;
	SIGNAL RegDst		:	STD_LOGIC;
	SIGNAL PCWrite		:	STD_LOGIC;
	SIGNAL ALUSourceB	:	STD_LOGIC;
	SIGNAL MovCond		:	STD_LOGIC;
	SIGNAL Resetn		:	STD_LOGIC;
	
	SIGNAL operatorA	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL operatorB	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL Result		:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL Overflow	:	STD_LOGIC;
	
	COMPONENT PC
		PORT (
			Address_out				 : 	OUT 	STD_LOGIC_VECTOR(15 DOWNTO 0);
			Clock, PCWrite,Resetn : 	IN 	STD_LOGIC
		);
	END COMPONENT;
	
	COMPONENT RegBank
		PORT (
			regwrite, Clock, Resetn: IN STD_LOGIC;
			S1: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
			S2: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
			N: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			Rs: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			Rt: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			Rd: IN STD_LOGIC_VECTOR (3 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT ULA
		PORT (
			Cin, Clock  	:	IN  STD_LOGIC;
			X,Y  				:	IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
			S    				:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			Op   				:	IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			Cout,Overflow 	: 	OUT STD_LOGIC
		);
	END COMPONENT;
	
	COMPONENT CACHE
		PORT (
			address_PC: IN STD_LOGIC_VECTOR (15 DOWNTO 0); -- converter e salvar em int_address
			address_mem: IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- converter e salvar em dada_address
			data_instruction :OUT STD_LOGIC_VECTOR (15 DOWNTO 0); 
			data_in: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			data_out: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
			MemWrite, Clock, MemtoReg: IN STD_LOGIC
		);
	END COMPONENT;
	
	COMPONENT MUX
		PORT (
			X,Y: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			Z: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
			S, Clock: STD_LOGIC
		);
	END COMPONENT;
	
	COMPONENT Controle
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
	END COMPONENT;
	
	COMPONENT Instruction_Reg
		PORT (
			Mem_in: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			OPCode, Ri, Rj, Rk: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			Clock, Mov_Cond: IN STD_LOGIC
		);
	END COMPONENT;
	
BEGIN
	PROCESS(Clock)
	BEGIN
	
	END PROCESS;
END Behavior;
