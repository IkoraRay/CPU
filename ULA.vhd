LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;



ENTITY ULA IS
PORT(
		Cin  :IN  STD_LOGIC;
		X,Y  :IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		S    :OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		Op   :IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		Cout,Overflow : OUT STD_LOGIC);
		
	 END ULA;
	 
	 ARCHITECTURE LogicFunc OF ULA IS
		SIGNAL Sum1: STD_LOGIC_VECTOR(7 DOWNTO 0);
		SIGNAL Sum2: STD_LOGIC_VECTOR(8 DOWNTO 0);
		SIGNAL L1: STD_LOGIC_VECTOR(7 DOWNTO 0);
		SIGNAL l2: STD_LOGIC_VECTOR(7 DOWNTO 0);
		SIGNAL Sub: STD_LOGIC_VECTOR(7 DOWNTO 0);
	 BEGIN
		Sum1 <=  X + Y + Cin;
		Sum2 <=  (X & '0') + Y + Cin;
		Sub <= X + (NOT Y) + 1 ;
		L1 <= X AND Y;
		L2 <= X OR Y;
		Cout <= Sum2(8);
		Overflow <= Sum2(8) XOR X(7) XOR Y(7) XOR Sum1(7);
		WITH Op SELECT
				S <=  L1 WHEN "00",
				L2 WHEN "01",
				Sum1 WHEN "10",
				Sub WHEN OTHERS ;
		
	 END LogicFunc;