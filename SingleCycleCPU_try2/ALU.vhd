library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ALU is
	port(
		clk 		: IN std_logic;
		ALUc 		: IN std_logic_vector(2 downto 0);
		regA 		: IN std_logic_vector(31 downto 0);
		regB 		: IN std_logic_vector(31 downto 0);
		regOut 		: OUT std_logic_vector(31 downto 0);
		zero 		: OUT std_logic
		);
end ALU;

architecture arch of ALU is
--	signal result : std_logic_vector(31 downto 0);
	begin
		process(ALUc)
			begin
--				if (clk = '1' and clk'EVENT) then
				case ALUc is
					when "000" 	=> --LI
						regOut <= regA + regB;
					when "001" 	=> --SI
						regOut <= regA + regB;
					when "010" 	=> --ADDI
						regOut <= regA + regB;
					when "011" 	=> --ADD R-Type
						regOut <= regA + regB;
					when "100" 	=> --SUB R-Type
						regOut <= regA - regB;
					when "110" 	=> --AND R-Type
						regOut <= regA AND regB;
					when "111" 	=> --OR R-Type
						regOut <= regA OR regB;
					when "101" 	=> --BEQ
						if(regA = regB) then
							zero <= '1';
						else
							zero <= '0';
						end if;
					when others =>
						regOut <= (others => 'U');
				end case;
--			end if;
		end process;
--			process(clk)
--				begin
--				if (clk = '0' and clk'EVENT) then
--					regOut <= result;
--				end if;
--		end process;
end arch;