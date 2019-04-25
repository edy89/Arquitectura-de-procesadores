library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
entity sumador is
    Port ( clk: in std_logic;
			  datain1 : in  STD_LOGIC_VECTOR(31 downto 0);
           datain2 : in  STD_LOGIC_VECTOR(31 downto 0);
           dataout : out  STD_LOGIC_VECTOR(31 downto 0)
			 );
end sumador;
architecture Behavioral of sumador is
signal r1,r2,suma : unsigned(31 downto 0);
begin
	 process(clk)
	 begin
		r1<=unsigned(datain1);
		r2<=unsigned(datain2);
		suma<=r1+r2;
		dataout<=STD_LOGIC_VECTOR(suma);
	 end process;
end Behavioral;

