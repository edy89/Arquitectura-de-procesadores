library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity InstructionMemory is
    Port ( RST : in  STD_LOGIC;
           DataIn : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           DataOutIM : out  STD_LOGIC_VECTOR(31 DOWNTO 0));
end InstructionMemory;
architecture Behavioral of InstructionMemory is
type rom_type is array (63 downto 0) of STD_LOGIC_VECTOR (31 downto 0);                 
    signal ROM : rom_type:= ("00000000000000000000000000000000","00000000000000000000000000000000",
									  "00000000000000000000000000000000","00000000000000000000000000000000",
									  
									  "00000000000000000000000000000000","00000000000000000000000000000000",
									  "00000000000000000000000000000000","00000000000000000000000000000000",
									  "00000000000000000000000000000000","00000000000000000000000000000000",
									  "00000000000000000000000000000000","00000000000000000000000000000000",
									  "00000000000000000000000000000000","00000000000000000000000000000000",
									  "00000000000000000000000000000000","00000000000000000000000000000000",
									  "00000000000000000000000000000000","00000000000000000000000000000000",
									  "00000000000000000000000000000000","00000000000000000000000000000000",
									  "00000000000000000000000000000000","00000000000000000000000000000000",
									  "00000000000000000000000000000000","00000000000000000000000000000000",
									  "00000000000000000000000000000000","00000000000000000000000000000000",
									  "00000000000000000000000000000000","00000000000000000000000000000000",
									  "00000000000000000000000000000000","00000000000000000000000000000000",
									  "00000000000000000000000000000000","00000000000000000000000000000000",
									  "00000000000000000000000000000000","00000000000000000000000000000000",
									  "00000000000000000000000000000000","00000000000000000000000000000000",
									  "00000000000000000000000000000000","00000000000000000000000000000000",
									  "00000000000000000000000000000000","00000000000000000000000000000000",
									  "00000000000000000000000000000000","00000000000000000000000000000000",
									  "00000000000000000000000000000000","00000000000000000000000000000000",
									  "00000000000000000000000000000000","00000000000000000000000000000000",
									  "00000000000000000000000000000000","00000000000000000000000000000000",
									  "00000000000000000000000000000000","00000000000000000000000000000000",
									  "00000000000000000000000000000000","00000000000000000000000000000000",
									  "00000000000000000000000000000000","00000000000000000000000000000000",
									  "00000000000000000000000000000000","00000000000000000000000000000000",
									  "00000000000000000000000000000000","00000000000000000000000000000000",
									  "00000000000000000000000000000000","00000000000000000000000000000000",
									  "00000000000000000000000000000000","00000000000000000000000000000000",
									  "00000000000000000000000000000000","00000000000000000000000000000000");
begin
    process (DataIn)
    begin
        if RST='1' then
				DataOutIM <= ROM(conv_integer("00000000000000000000000000000000"));
        else
				DataOutIM <= ROM(conv_integer(DataIn));
        end if;
    end process;
end Behavioral;