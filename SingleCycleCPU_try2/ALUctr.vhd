library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;


ENTITY ALU IS
	port(
		A 		: IN std_logic_vector(31 downto 0);
		B 		: IN std_logic_vector(31 downto 0);
		ALUctr 	: IN std_logic_vector(3 downto 0);
		D 		: OUT std_logic_vector(31 downto 0);
		zero 	: OUT std_logic
		);
END ALU;


--WHEN COMPLETE, ADD OVERFLOW

--#######################
--# Operation #  ALUCtr #
--#######################
--#    AND    #   0000  #
--#    OR     #   0001  #
--#    ADD    #   0010  #
--#    SUB    #   0011  #		
--#    SLT 	  #	  0110  #



ARCHITECTURE behavior of ALU IS
signal subwire0 	: std_logic_vector(31 downto 0);
signal subwireA 	: signed(31 downto 0);
signal subwireB 	: signed(31 downto 0);
begin
	process(ALUctr)
		begin
			subwireA <= signed(A);
			subwireB <= signed(B);
			case ALUctr IS
				when "0000" =>
					subwire0 <= A and B;
				when "0001" =>
					subwire0 <= A or B;
				when "0010" =>
					subwire0 <= subwireA + subwireB;
				when "0011" =>
					subwire0 <= subwireA - subwireB;
				when "0110" =>
					if (subwireA < subwireB) then 
						subwire0 <= (others => '0');
					else
						subwire0 <= (others => '0');
					end if;
				when others =>
					subwire0 <= (others => '0');
			end case;
	end process;
	D <= subwire0;
	zero <= '1' when (subwire0 = 0) else '0';
	
END behavior;