library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity control IS
	port (
			opcode: in std_logic_vector(5 downto 0);
			RegDst, branch, MemRd, Mem2Reg, MemWr, ALUsrc, regWr: out std_logic;
			aluop: out std_logic_vector(1 downto 0)
		);
end control;

architecture behav of control IS
	begin
		process(opCode)
			begin
				case opCode is 
					when "000000" => --R Type Instructions
						ALUop 	<= "10";
						ALUsrc 	<= '0';
						RegDst 	<= '1';
						RegWr 	<= '1';
						branch 	<= '0';
						MemRd 	<= '0';
						MemWr 	<= '0';
						Mem2Reg <= '0';
					when "001000" => --AddI
						ALUop 	<= "00";
						ALUsrc 	<= '1';
						RegDst 	<= '0';
						RegWr 	<= '1';
						branch 	<= '0';
						MemRd 	<= '0';
						MemWr 	<= '0';
						Mem2Reg <= '0';
					when "000101" => --OrI
						ALUop 	<= "01";
						ALUsrc 	<= '1';
						RegDst 	<= '0';
						RegWr 	<= '1';
						branch 	<= '0';
						MemRd 	<= '0';
						MemWr 	<= '0';
						Mem2Reg <= '0';
					when "000100" => --BEQ
						ALUop 	<= "01";
						ALUsrc 	<= '0';
						RegDst 	<= '0';
						RegWr 	<= '0';
						branch 	<= '1';
						MemRd 	<= '0';
						MemWr 	<= '0';
						Mem2Reg <= '0';
					when "100011" => --LW
						ALUop 	<= "00";
						ALUsrc 	<= '1';
						RegDst 	<= '0';
						RegWr 	<= '1';
						branch 	<= '0';
						MemRd 	<= '1';
						MemWr 	<= '0';
						Mem2Reg <= '1';
					when "101011" => --SW
						ALUop 	<= "00";
						ALUsrc 	<= '1';
						RegDst 	<= '0';
						RegWr 	<= '0';
						branch 	<= '0';
						MemRd 	<= '0';
						MemWr 	<= '1';
						Mem2Reg <= '0';
					when others =>
						ALUop 	<= "--";
						ALUsrc 	<= '-';
						RegDst 	<= '-';
						RegWr 	<= '-';
						branch 	<= '-';
						MemRd 	<= '-';
						MemWr 	<= '-';
						Mem2Reg <= '-';
				end case;
		end process;
end behav;