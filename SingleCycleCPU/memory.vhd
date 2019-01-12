library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity memory is
	port(
		--clk 		: IN std_logic;
		addr 		: IN std_logic_vector(31 downto 0);
		data 		: IN std_logic_vector(31 downto 0);
		memWr 		: IN std_logic;
		memRd 		: IN std_logic;
		q			: OUT std_logic_vector(31 downto 0)
		);
end memory;

architecture behav of memory is
type memArray is array(0 to 31) of std_logic_vector(31 downto 0);

signal memData 		: memArray :=
(
	X"00000000", X"00000000", X"00000000", X"00000000", X"00000000", 
	X"00000000", X"00000000", X"00000000", X"00000000", X"00000000", 
	X"00000000", X"00000000", X"00000000", X"00000000", X"00000000", 
	X"00000000", X"00000000", X"00000000", X"00000000", X"00000000", 
	X"00000000", X"00000000", X"00000000", X"00000000", X"00000000", 
	X"00000000", X"00000000", X"00000000", X"00000000", X"00000000", 
	X"00000000", X"00000000"
);
begin
process
begin
			if(memWr = '1') then
				memData(conv_integer(addr(6 downto 2))) <= data;
			elsif (memRd = '1') then
			q <= memData(conv_integer(addr(6 downto 2)));
		else
			q <= (others => '0');
		end if;
end process;

end behav;