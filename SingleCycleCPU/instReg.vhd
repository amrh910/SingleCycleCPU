library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity instReg is 
	port (
			rdAdd: in STD_LOGIC_VECTOR (4 downto 0);
			instr: out STD_LOGIC_VECTOR (31 downto 0)
			);
end instReg;

architecture behav of instReg is

type memArray is array(0 to 13) of std_logic_vector(31 downto 0);
signal memData 	: memArray;

begin
memData(0) <= "00001100000000000000000000000001"; --li r0, 1
memData(1) <= "00001100000000010000000000000111"; --li r1, 7
memData(2) <= "00001000000000010001000000000000"; --add r2, r0, r1

memData(3) <= "00001100000000010000000000000000"; --li r1, 0
memData(4) <= "00001000001000100001100000000000"; --add r3, r1, r2

memData(5) <= "00001100000000000000000000000001"; --li r0, 1
memData(6) <= "00001100000000010000000000000111"; --li r1, 7
memData(7) <= "00000000000000010000000000000000"; --sw r1, mem0
memData(8) <= "00000000000000000000000000000001"; --sw r0, mem1
memData(9) <= "00000100000000100000000000000000"; --lw r2, mem0
memData(10) <= "00000100000000110000000000000001"; --lw r3, mem1
memData(11) <= "00001000011000100010000000000000"; --add r4, r3, r2

memData(12) <= "00001100000000010000000000000111"; --li r1, 7
memData(13) <= "00010000000000010001000000000000"; --sll r2, r1

 	instr <= memData(to_integer(unsigned(rdAdd(4 downto 0))));
end behav;