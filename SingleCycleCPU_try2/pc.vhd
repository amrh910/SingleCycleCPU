library ieee;
use ieee.std_logic_1164.all;

entity pc is
	port(
		InstAdd 		: IN std_logic_vector(4 downto 0);
		instruction 	: OUT std_logic_vector(4 downto 0)
		);
end entity;

architecture arch of pc is
	begin
		instruction <= InstAdd;

end arch;