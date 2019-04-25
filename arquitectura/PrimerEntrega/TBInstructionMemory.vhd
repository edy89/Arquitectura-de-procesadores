LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY TBInstructionMemory IS
END TBInstructionMemory;
ARCHITECTURE behavior OF TBInstructionMemory IS 
    COMPONENT InstructionMemory
    PORT(
         RST : IN  std_logic;
         DataIn : IN  std_logic_vector(31 downto 0);
         DataOutIM : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
   --Inputs
   signal RST : std_logic := '0';
   signal DataIn : std_logic_vector(31 downto 0) := (others => '0');
 	--Outputs
   signal DataOutIM : std_logic_vector(31 downto 0);
   constant RST_period : time := 10 ns;
BEGIN
   uut: InstructionMemory PORT MAP (
          RST => RST,
          DataIn => DataIn,
          DataOutIM => DataOutIM
        );
   RST_process :process
   begin
		RST <= '0';
		wait for RST_period/2;
		RST <= '1';
		wait for RST_period/2;
   end process;
   stim_proc: process
   begin		
      wait for 50 ns;	
		RST <= '1';
		DataIn <= "00000000000000000000000000000000";
		wait for 50 ns;	
		RST <= '0';
		DataIn <= "00000000000000000000000000000001";
		wait for 50 ns;	
		RST <= '0';
		DataIn <= "00000000000000000000000000000010";
   end process;
END;
