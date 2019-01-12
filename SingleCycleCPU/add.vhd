library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity add is
	generic (n: natural := 1);
	port(
		A 		: IN std_logic_vector(n-1 downto 0);
		B 		: IN std_logic_vector(n-1 downto 0);
		C 		: OUT std_logic_vector(n-1 downto 0)
		);
end add;

architecture arch of add is
	begin
		C <= A + B;
end arch;
