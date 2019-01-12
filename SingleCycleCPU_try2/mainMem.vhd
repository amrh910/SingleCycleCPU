library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mainMem is
	port(
		clk 		: IN std_logic;
		wrEn 		: IN std_logic;
		rdAddrA 	: IN std_logic_vector(4 downto 0);
		rdAddrB 	: IN std_logic_vector(4 downto 0);
		wrAddr	 	: IN std_logic_vector(4 downto 0);
		data 		: IN std_logic_vector(31 downto 0);
		qa 			: OUT std_logic_vector(31 downto 0);
		qb 			: OUT std_logic_vector(31 downto 0)
		);
end mainMem;

architecture arch of mainMem is
	type memArray is array(0 to 19) of std_logic_vector(31 downto 0);
	signal memData 		: memArray;

	begin
		process(clk)
			begin
				if rising_edge(clk) and wrEn = '0' then
					qa <= memData(to_integer(unsigned(rdAddrA)));
					qb <= memData(to_integer(unsigned(rdAddrB)));
				elsif rising_edge(clk) and wrEn = '1' then
						memData(to_integer(unsigned(wrAddr))) <= data;
					end if;
		end process;

end arch;