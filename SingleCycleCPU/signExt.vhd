library ieee;
use ieee.std_logic_1164.all;

entity signExt is
	port(
		A 		: IN std_logic_vector(15 downto 0);
		aExt 	: OUT std_logic_vector(31 downto 0)
		);
end signExt;

architecture arch of signExt is	
	begin
		aExt(15 downto 0) <= A;
		aExt(31 downto 16) <= (others => '0');
end arch;