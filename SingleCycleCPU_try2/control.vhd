library ieee;
use ieee.std_logic_1164.all;

entity control is
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
		memRd				: OUT std_logic;
		mem2reg				: OUT std_logic;
		regDst 				: OUT std_logic;
		regWr 				: OUT std_logic
		);
end control;

architecture arch of control is
	begin
		process(instruction)
			begin
				case instruction(31 downto 26) is 
					when "000001" => --LI
				 	ALUop	<= "00";
				 	ALUsrc 	<= '1';
				 	branch 	<= '0';
				 	memWr 	<= '0';
				 	memRd	<= '1';
				 	mem2Reg <= '1';
				 	regDst 	<= '0';
				 	regWr 	<= '1';
			 		when "000011" => --SI
			 		ALUop	<= "01";
				 	ALUsrc 	<= '1';
				 	branch 	<= '0';
				 	memWr 	<= '1';
				 	memRd	<= '0';
				 	mem2Reg <= 'U';
				 	regDst 	<= 'U';
				 	regWr 	<= '0';
			 		when "000010" => --ADDI
			 		ALUop	<= "10";
				 	ALUsrc 	<= '1';
				 	branch 	<= '0';
				 	memWr 	<= '0';
				 	memRd	<= '0';
				 	mem2Reg <= '0';
				 	regDst 	<= '0';
				 	regWr 	<= '0';
				 	when "111111" => --BEQ
			 		ALUop	<= "11";
				 	ALUsrc 	<= '0';
				 	branch 	<= '1';
				 	memWr 	<= '0';
				 	memRd	<= '0';
				 	mem2Reg <= '0';
				 	regDst 	<= '0';
				 	regWr 	<= '0';
			 		when "000000" => --R type
			 		ALUop	<= "11";
				 	ALUsrc 	<= '0';
				 	branch 	<= '0';
				 	memWr 	<= '0';
				 	memRd	<= '0';
				 	mem2Reg <= '0';
				 	regDst 	<= '1';
				 	regWr 	<= '1';
				 	when others =>
			 		ALUop	<= "UU";
				 	ALUsrc 	<= 'U';
				 	branch 	<= 'U';
				 	memWr 	<= 'U';
				 	mem2Reg <= 'U';
				 	regDst 	<= 'U';
				 	regWr 	<= 'U';
			 	end case;
	 	end process;
rs 		<=	instruction(25 downto 21);
rt 		<=	instruction(20 downto 16);
rd 		<=	instruction(15 downto 11);
imm 	<=	instruction(15 downto 0);
funct 	<= 	instruction(5 downto 0);
end arch;