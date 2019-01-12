library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dataMem is
	port (
			ck: in std_logic;
			wrEn: in std_logic;
			rdAddrA, rdAddrB, wrAddr: in std_logic_vector(4 downto 0);
			wrData: in std_logic_vector(31 downto 0);
			rdDataA, rdDataB: out std_logic_vector(31 downto 0)
		);
end dataMem;

architecture behav of dataMem is
	type memArray is array(0 to 31) of std_logic_vector(31 downto 0);

	signal regMem 	: memArray :=
	(
		(others => '0'), (others => '0'), (others => '0'), (others => '0'), (others => '0'), 
		(others => '0'), (others => '0'), (others => '0'), (others => '0'), (others => '0'), 
		(others => '0'), (others => '0'), (others => '0'), (others => '0'), (others => '0'), 
		(others => '0'), (others => '0'), (others => '0'), (others => '0'), (others => '0'), 
		(others => '0'), (others => '0'), (others => '0'), (others => '0'), (others => '0'), 
		(others => '0'), (others => '0'), (others => '0'), (others => '0'), (others => '0'), 
		(others => '0'), (others => '0')
	);

	begin

		process(ck)
			begin
				if rising_edge(ck) and wrEn = '0' then
					rdDataA <= regMem(to_integer(unsigned(rdAddrA)));
					rdDataB <= regMem(to_integer(unsigned(rdAddrB)));
				end if;
				if falling_edge(ck) and wrEn = '1' then
					regMem(to_integer(unsigned(wrAddr))) <= wrData;
				end if;
		end process;
end behav;