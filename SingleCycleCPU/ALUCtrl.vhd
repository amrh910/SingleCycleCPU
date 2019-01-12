library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALUCtr is
	port(
		funct 	: IN std_logic_vector(5 downto 0);
		ALUop 	: IN std_logic_vector(1 downto 0);
		ALUCtr 	: OUT std_logic_vector(3 downto 0)
		);
end ALUCtr;

architecture arch of ALUCtr is
	begin
	ALUCtr <= 		"0000" when (ALUop = "10" and funct = "100100") else
					"0001" when (ALUop = "10" and funct = "100101") else
					"0010" when (ALUop = "00" or (ALUop = "10" and funct = "100000")) else
					"0011" when (ALUop = "11") else
					"0110" when (ALUop = "01" or (ALUop = "10" and funct = "100010")) else
					"0111" when (ALUop = "10" and funct = "101010") else
					"0000";
end arch;