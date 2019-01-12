library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity signExt is
	port(
		a 		: IN std_logic_vector(15 downto 0);
		aExt	: OUT std_logic_vector(31 downto 0)
		);
end signExt;

architecture arch of signExt is
	signal subwire0 : std_logic_vector(15 downto 0);
	signal subwire1 : std_logic_vector(31 downto 0);

	begin
		subwire0 <= a;
		aExt <= subwire1;
		process(a)
		begin
		if (a(15) = '1') then
			subwire1 <= (others => '1');
			subwire1(15 downto 0) <= subwire0;
		else
			subwire1 <= (others => '0');
			subwire1(15 downto 0) <= subwire0;
		end if;
	end process;
end arch;