library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity instReg is 
	port(
		instrIN 		: IN std_logic_vector(4 downto 0);
		instrOUT 		: OUT std_logic_vector(31 downto 0)
		);
end instReg;

architecture arch of instReg is
type instruction is array(2 downto 0) of std_logic_vector(31 downto 0);
signal index : instruction;

begin
	index(0) <= "00000100000000000000000000000010"; --li r0, 1
	index(1) <= "00000100001000000000000000000001"; --li r1,5
	index(2) <= "00000000010000000000100000000000"; --add r3, r1, r2
--	index(4) <= "11111100000000010000000000001111"; 
--	index(5) <= "";
--	index(6) <= "";
--	index(7) <= "";
--	index(8) <= "";
instrOut <= index(to_integer(unsigned(instrIN)));
end arch;