library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity entrega1 is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           instructionout : out  std_logic_vector(31 downto 0));
end entrega1;

architecture Behavioral of entrega1 is


signal a,b,c:std_logic_vector(31 downto 0);

COMPONENT Modulo1
	PORT(
		rst : IN std_logic;
		clk : IN std_logic;
		datain : IN std_logic_vector(31 downto 0);          
		dataout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	

COMPONENT Modulo2
	PORT(
		rst : IN std_logic;
		clk : IN std_logic;
		datain : IN std_logic_vector(31 downto 0);          
		dataout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	

	COMPONENT im
	PORT(
		address : IN std_logic_vector(31 downto 0);
		rst : IN std_logic;          
		instruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	

	COMPONENT sumador
	PORT(
		clk : IN std_logic;
		datain1 : IN std_logic_vector(31 downto 0);
		datain2 : IN std_logic_vector(31 downto 0);          
		dataout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	

begin

Inst_Modulo1: Modulo1 PORT MAP(
		rst => rst,
		clk => clk,
		datain => a,
		dataout => b
	);

Inst_sumador: sumador PORT MAP(
		
		datain1 => c,
		datain2 => "00000000000000000000000000000001",
		dataout => a
	);
Inst_im: im PORT MAP(
		address => c,
		rst => rst,
		instruction => instructionout 
	);
Inst_Modulo2: Modulo2 PORT MAP(
		rst => rst,
		clk => clk,
		datain => b,
		dataout => c 
	);
	
	

end Behavioral;

