library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity Modulo1 is
    Port ( rst : in  STD_LOGIC;
			  clk: in std_logic;
           datain : in  STD_LOGIC_VECTOR (31 downto 0);
           dataout : out  STD_LOGIC_VECTOR (31 downto 0));
end Modulo1;
architecture Behavioral of Modulo1 is
begin
    process(clk,rst)
    begin
        if rst = '1' then
            dataout <= "00000000000000000000000000000000";
        elsif rising_edge(clk) then
            dataout <= datain;     
        end if;
    end process;
end Behavioral;

