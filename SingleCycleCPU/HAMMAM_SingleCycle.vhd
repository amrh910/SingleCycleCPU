library ieee;
use ieee.std_logic_1164;

PACKAGE Hammam_SingleCycle IS
component PC is
	port(
		clk 		: IN std_logic;
		addr 		: IN std_logic_vector(4 downto 0);
		CurrAdd 	: OUT std_logic_vector(4 downto 0)
		);
end component;

component instReg is 
	port(
		rdAdd	 	: IN std_logic_vector(4 downto 0);
		inst 		: OUT std_logic_vector(31 downto 0)
		);
end component;

component dataMem is
	port(
		clk 		: IN std_logic;
		wrEn 		: IN std_logic;
		wrAddr 		: IN std_logic_vector(4 downto 0);
		rdAddrA 	: IN std_logic_vector(4 downto 0);
		rdAddrB 	: IN std_logic_vector(4 downto 0);
		wrData 		: IN std_logic_vector(31 downto 0);
		rdDataA 	: OUT std_logic_vector(31 downto 0);
		rdDataB 	: OUT std_logic_vector(31 downto 0)
		);
end component;

component memory is
	port(
		clk 		: IN std_logic;
		addr 		: IN std_logic_vector(31 downto 0);
		data 		: IN std_logic_vector(31 downto 0);
		memWr 		: IN std_logic;
		memRd 		: IN std_logic;
		q			: OUT std_logic_vector(31 downto 0)
		);
end component;

component control IS
	port(
		opCode 		: IN std_logic_vector(5 downto 0);
		ALUop 		: OUT std_logic_vector(1 downto 0);
		ALUsrc		: OUT std_logic;
		RegDst 		: OUT std_logic;
		RegWr		: OUT std_logic;
		jump 		: OUT std_logic;
		branch 		: OUT std_logic;
		MemRd 		: OUT std_logic;
		MemWr 		: OUT std_logic;
		Mem2Reg 	: OUT std_logic
		);
end component;

component ALUCtr is
	port(
		funct 	: IN std_logic_vector(5 downto 0);
		ALUop 	: IN std_logic_vector(1 downto 0);
		ALUCtr 	: OUT std_logic_vector(3 downto 0)
		);
end component;

component ALU IS
	port(
		A 		: IN std_logic_vector(31 downto 0);
		B 		: IN std_logic_vector(31 downto 0);
		ALUctr 	: IN std_logic_vector(3 downto 0);
		D 		: OUT std_logic_vector(31 downto 0);
		zero 	: OUT std_logic
		);
end component;

component shift is
	generic (n1: natural := 32; n2: natural := 32; k: natural := 2);
	port(
		A 	: IN std_logic_vector(n1-1 downto 0);
		B 	: OUT std_logic_vector(n2-1 downto 0)
		);
end component;

component mux is
	generic (n: natural := 1);
	port(
	A 		: IN std_logic_vector(n-1 downto 0);
	B 		: IN std_logic_vector(n-1 downto 0);
	sel 	: IN std_logic;
	pout 	: OUT std_logic_vector(n-1 downto 0)
	);
end component;

component signExt is
	port(
		A 		: IN std_logic_vector(15 downto 0);
		aExt 	: OUT std_logic_vector(31 downto 0)
		);
end component;

component add is
	port(
		A 		: IN std_logic_vector(31 downto 0);
		B 		: IN std_logic_vector(31 downto 0);
		C 		: OUT std_logic_vector(31 downto 0)
		);
end component;




END PACKAGE;