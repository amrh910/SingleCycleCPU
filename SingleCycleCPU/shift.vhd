library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shift is
	generic (n1: natural := 32; n2: natural := 32; k: natural := 2);
	port(
		A 	: IN std_logic_vector(n1-1 downto 0);
		B 	: OUT std_logic_vector(n2-1 downto 0)
		);
end shift;

architecture arch of shift is
	signal subwire0 	: std_logic_vector(n2-1 downto 0);
	
	begin
		subwire0 	<= std_logic_vector(resize(unsigned(A), n2));
		B 			<= std_logic_vector(shift_left(signed(subwire0), k));
end arch;