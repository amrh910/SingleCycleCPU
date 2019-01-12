library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux is
	generic (n: natural := 1);
	port(
	A 		: IN std_logic_vector(n-1 downto 0);
	B 		: IN std_logic_vector(n-1 downto 0);
	sel 	: IN std_logic;
	pout 	: OUT std_logic_vector(n-1 downto 0)
	);
end mux;

architecture arch of mux is
	begin
		pout <= A when (sel = '0') else B;
end arch;