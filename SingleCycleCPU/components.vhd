library ieee;
use ieee.std_logic_1164.all;

package components is

component dataMem is
	port(
		clk		: IN std_logic;
		addr 	: IN std_logic_vector(31 downto 0);
		dataIn 	: IN std_logic_vector(31 downto 0);
		dataOut : OUT std_logic_vector(31 downto 0);
		wrEn 	: IN std_logic
		);
end component;

component mainMem is
	port(
		clk 		: IN std_logic;
		wrEn 		: IN std_logic;
		rdAddrA 	: IN std_logic_vector(4 downto 0);
		rdAddrB 	: IN std_logic_vector(4 downto 0);
		wrAddr	 	: IN std_logic_vector(4 downto 0);
		data 		: IN std_logic_vector(31 downto 0);
		qa 			: OUT std_logic_vector(31 downto 0);
		qb 			: OUT std_logic_vector(31 downto 0)
		);
end component;

component signExt is
	port(
		a 		: IN std_logic_vector(15 downto 0);
		aExt	: IN std_logic_vector(31 downto 0)
		);
end component;

component ALU is
	port(
		clk 		: IN std_logic;
		ALUc 		: IN std_logic_vector(2 downto 0);
		regA 		: IN std_logic_vector(31 downto 0);
		regB 		: IN std_logic_vector(31 downto 0);
		regOut 		: OUT std_logic_vector(31 downto 0);
		zero 		: OUT std_logic
		);
end component;

component ALUctr is
	port(
		ALUop		: IN std_logic_vector(1 downto 0);
		funct 		: IN std_logic_vector(5 downto 0);
		ALUc 		: OUT std_logic_vector(2 downto 0)
		);
end component;

component nMux is
	generic (n: natural := 1);
	port(
		clk 		: IN std_logic;
		sel 		: IN std_logic;
		regA 		: IN std_logic_vector(n-1 downto 0);
		regB 		: IN std_Logic_vector(n-1 downto 0);
		regOut 		: OUT std_logic_vector(n-1 downto 0)
		);
end component;

component control is
	port(
		instruction 		: IN std_logic_vector(31 downto 0);
		rs 					: OUT std_logic_vector(4 downto 0);
		rt 					: OUT std_logic_vector(4 downto 0);
		rd					: OUT std_logic_vector(4 downto 0);
		funct 				: OUT std_logic_vector(5 downto 0);
		imm 				: OUT std_logic_vector(15 downto 0);
		ALUop 				: OUT std_logic_vector(1 downto 0);
		ALUsrc 				: OUT std_logic;
		branch 				: OUT std_logic;
		memWr 				: OUT std_logic;
		mem2reg				: OUT std_logic;
		regDst 				: OUT std_logic;
		regWr 				: OUT std_logic
		);
end component;

component instReg is 
	port(
		instrIN 		: IN std_logic_vector(3 downto 0);
		instrOUT 		: OUT std_logic_vector(31 downto 0)
		);
end component;

end package;