library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity ProgramCounter2 is
    Port ( RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           DataIn : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           DataOut : out  STD_LOGIC_VECTOR(31 DOWNTO 0));
end ProgramCounter2;
architecture Behavioral of ProgramCounter2 is
begin
    process(CLK,RST)
    begin
        if RST = '1' then
            dataOut <= "00000000000000000000000000000000";
        elsif rising_edge(CLK) then
            DataOut <= DataIn;     
        end if;
    end process;
end Behavioral;