LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
ENTITY TBProgramCounter2 IS
END TBProgramCounter2; 
ARCHITECTURE behavior OF TBProgramCounter2 IS 
    COMPONENT ProgramCounter2
    PORT(
         RST : IN  std_logic;
         CLK : IN  std_logic;
         DataIn : IN  std_logic_vector(31 downto 0);
         DataOut : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
	--Inputs
   signal RST : std_logic := '0';
   signal CLK : std_logic := '0';
   signal DataIn : std_logic_vector(31 downto 0) := (others => '0');
   --Outputs
	signal DataOut : std_logic_vector(31 downto 0);
   constant CLK_period : time := 10 ns;
BEGIN
   uut: ProgramCounter2 PORT MAP (
          RST => RST,
          CLK => CLK,
          DataIn => DataIn,
          DataOut => DataOut
        );
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
   stim_proc: process
   begin		
      wait for 50 ns;	
		RST <= '0';
		DataIn <= "11111111111111111111111111111111";
		wait for 50 ns;
		RST <= '1';
		DataIn <= "11111111111111111111111111111111";
		wait for 50 ns;
		RST <= '0';
		DataIn <= "11111111111111111111111111111111";
		wait for 50 ns;
		RST <= '1';
		DataIn <= "11111111111111111111111111111111";
   end process;
END;
