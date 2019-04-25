library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity Sumador is
    Port ( DataIn1 : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           DataIn2 : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           DataOut : out  STD_LOGIC_VECTOR(31 DOWNTO 0));
end Sumador;
architecture Behavioral of Sumador is
signal R1,R2,Suma : unsigned(31 downto 0);
begin
	 process(datain1)
	 begin
		R1<="00000000000000000000000000000000";
		R2<=unsigned(DataIn2);
		Suma<=R1+R2;
		DataOut<=STD_LOGIC_VECTOR(Suma);
	 end process;
end Behavioral;