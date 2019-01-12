library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.components.all;

entity main is
	port(
		clk 		: IN std_logic;
		inst 		: IN std_logic_vector(4 downto 0);
		hex8 		: OUT std_logic_vector(6 downto 0) := "0000001";
		hex7 		: OUT std_logic_vector(6 downto 0) := "0000001";
		hex6 		: OUT std_logic_vector(6 downto 0) := "0000001";
		hex5 		: OUT std_logic_vector(6 downto 0) := "0000001";
		hex4 		: OUT std_logic_vector(6 downto 0) := "0000001";
		hex3 		: OUT std_logic_vector(6 downto 0) := "0000001";
		hex2 		: OUT std_logic_vector(6 downto 0) := "0000001";
		hex1 		: OUT std_logic_vector(6 downto 0) := "0000001"
		);
end main;

architecture arch of main is

--signal pcOut 			: std_logic_vector(4 downto 0);
signal instruction		: std_logic_vector(31 downto 0);
signal op1, op2, opdes 	: std_logic_vector(4 downto 0);
signal conFunct 		: std_logic_vector(5 downto 0);
signal immediate 		: std_logic_vector(15 downto 0);
signal ALUop 			: std_logic_vector(1 downto 0);
signal src, br, wrmem, rdmem, memtoreg, dstreg, wrreg : std_logic;
signal ramMux 			: std_logic_vector(4 downto 0);
signal ALUc 			: std_logic_vector(2 downto 0);
signal A, B, B2, ALUout			: std_logic_vector(31 downto 0);
signal zer 				: std_logic;
signal dataIn			: std_logic_vector(31 downto 0);
signal immExt 			: std_logic_vector(31 downto 0);
signal dataOut 			: std_logic_vector(31 downto 0);
signal memIn 			: std_logic_vector(31 downto 0);


begin
--	PROGCOUNT 	: 	PC port map(inst, pcOut);
	loadInst	: 	instReg port map(inst, instruction);
	contUnit	: 	control port map(instruction, op1, op2, opdes, conFunct, immediate, ALUop, src, br, wrmem, rdmem, memtoreg, dstreg, wrreg);
	ram2Mux 		: 	nMux generic map(5) port map(dstreg, op2, opdes, ramMux);	
	contALU 	: 	ALUctr port map(ALUop, conFunct, aluc);
	sramMain	: 	mainMem port map(clk, wrreg, op1, op2, ramMux, memIn, A, B);
	aluMux 		: 	nMux generic map(32) port map(src, B, immExt, B2);
	mainALU 	: 	ALU port map(clk, aluc, A, B2, ALUout, zer);
	ext 		: 	signExt port map(immediate, immExt);
	finMem		: 	dataMem port map(clk, ALUout, B, dataOut, wrmem, rdmem);
	memMux		: 	nMux generic map(32) port map(memtoreg, dataOut, ALUout, memIn);
	--brMux 		: 	nMux generic map(32) port map(src,PCadd, addExt);


end arch;
