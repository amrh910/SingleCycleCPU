library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity adder is
	port(
		instruction 		: IN std_logic_vector(31 downto 0);
		incrInst			: OUT std_logic_vector(31 downto 0)
		);
end adder;

architecture arch of adder is 
	begin
		incrInst <= instruction + "00000000000000000000000000000001";

end arch;