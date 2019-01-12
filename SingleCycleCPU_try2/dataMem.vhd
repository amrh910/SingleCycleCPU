library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dataMem is
	port(
		clk		: IN std_logic;
		addr 	: IN std_logic_vector(31 downto 0);
		dataIn 	: IN std_logic_vector(31 downto 0);
		dataOut : OUT std_logic_vector(31 downto 0);
		wrEn 	: IN std_logic;
		rdEn 	: IN std_logic
		);
end dataMem;

architecture arch of dataMem is
type dataArray is array(0 to 30) of std_logic_vector(31 downto 0);
signal dataMem : dataArray;

begin

	dataOut <= dataMem(to_integer(unsigned(addr))) when rdEn = '1' else (others => '0');
	process(dataIn, clk)
		begin
			if clk = '0' and clk'event then
				if wrEn = '1' then
					dataMem(to_integer(unsigned(addr))) <= dataIn;
				end if;
			end if;
	end process;
end arch;