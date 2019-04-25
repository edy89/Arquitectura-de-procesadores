LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY TBControlUnit IS
END TBControlUnit;
ARCHITECTURE behavior OF TBControlUnit IS 
    COMPONENT ControlUnit
    PORT(
         op : IN  std_logic_vector(1 downto 0);
         op3 : IN  std_logic_vector(5 downto 0);
         cuout : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
   --Inputs
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');
 	--Outputs
   signal cuout : std_logic_vector(5 downto 0);
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: ControlUnit PORT MAP (
          op => op,
          op3 => op3,
          cuout => cuout
        );
   -- Stimulus process
   stim_proc: process
   begin		
      wait for 20 ns;
		op <= "10";
      op3 <= "000000";
		wait for 20 ns;
		op <= "10";
      op3 <= "000100";
		wait for 20 ns;
		op <= "11";
      op3 <= "000100";
		wait for 20 ns;
		op <= "10";
      op3 <= "000001";
   end process;
END;