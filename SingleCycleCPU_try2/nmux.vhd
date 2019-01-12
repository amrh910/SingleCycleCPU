library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity nMux is
	generic (n: natural := 1);
	port(
	--	clk 		: IN std_logic;
		sel 		: IN std_logic;
		regA 		: IN std_logic_vector(n-1 downto 0);
		regB 		: IN std_Logic_vector(n-1 downto 0);
		regOut 		: OUT std_logic_vector(n-1 downto 0)
		);
end nMux;

architecture arch of nMux is
	begin
		regOut <= regB when sel = '1' else regA;
end arch;