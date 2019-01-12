library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity PC is
	port(
		clk 		: IN std_logic;
		addr 		: IN std_logic_vector(4 downto 0);
		instrAddr 	: OUT std_logic_vector(4 downto 0)
		);
end PC;

architecture behav of PC is

	
	begin
		process(clk)
			begin
				if rising_edge(clk) then
					instrAddr <= addr;
				end if;
		end process;

end behav;