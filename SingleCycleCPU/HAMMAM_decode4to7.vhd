library ieee;
use ieee.std_logic_1164.all;

entity decode4to7 is
	port(
		four : in std_logic_vector(3 downto 0);
		segment : out std_logic_vector(6 downto 0)
		);
end decode4to7;

architecture arch of decode4to7 is
signal led : std_logic_vector(6 downto 0);
	begin
		process (four)
			begin
				case four is
				when "0000" => led <= "1111110";
				when "0001" => led <= "0110000";
				when "0010" => led <= "1101101";
				when "0011" => led <= "1111001";
				when "0100" => led <= "0110011";
				when "0101" => led <= "1011011";
				when "0110" => led <= "1011111";
				when "0111" => led <= "1110000";
				when "1000" => led <= "1111111";
				when "1001" => led <= "1110011";
				when "1010" => led <= "1110111";
				when "1011" => led <= "0011111";
				when "1100" => led <= "1001110";
				when "1101" => led <= "0111101";
				when "1110" => led <= "1001111";
				when "1111" => led <= "1000111";
				end case;
			end process;
segment(0) <= NOT led(6);
segment(1) <= NOT led(5);
segment(2) <= NOT led(4);
segment(3) <= NOT led(3);
segment(4) <= NOT led(2);
segment(5) <= NOT led(1);
segment(6) <= NOT led(0);
end arch;
