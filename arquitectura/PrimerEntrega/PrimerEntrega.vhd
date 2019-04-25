library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
entity PrimerEntrega is
    Port ( RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           DataOut : out  STD_LOGIC_vector(31 downto 0));
end PrimerEntrega;

architecture Behavioral of PrimerEntrega is
signal a,b,c:std_logic_vector(31 downto 0);
COMPONENT ProgramCounter1
	PORT(
		RST : IN std_logic;
		CLK : IN std_logic;
		DataIn : IN std_logic_vector(31 downto 0);          
		DataOut : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT ProgramCounter2
	PORT(
		RST : IN std_logic;
		CLK : IN std_logic;
		DataIn : IN std_logic_vector(31 downto 0);          
		DataOut : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT Sumador
	PORT(
		DataIn1 : IN std_logic_vector(31 downto 0);
		DataIn2 : IN std_logic_vector(31 downto 0);          
		DataOut : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT InstructionMemory
	PORT(
		RST : IN std_logic;
		DataIn : IN std_logic_vector(31 downto 0);          
		DataOutIM : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
begin
Inst_ProgramCounter1: ProgramCounter1 PORT MAP(
		RST => RST,
		CLK => CLK,
		DataIn => a,
		DataOut => b
	);
Inst_ProgramCounter2: ProgramCounter2 PORT MAP(
		RST => RST,
		CLK => CLK,
		DataIn => b,
		DataOut => c
	);
Inst_Sumador: Sumador PORT MAP(
		DataIn1 => c,
		DataIn2 => "00000000000000000000000000000001",
		DataOut => a
	);
Inst_InstructionMemory: InstructionMemory PORT MAP(
		RST => RST,
		DataIn => c,
		DataOutIM => DataOut
	);
	
end Behavioral;

