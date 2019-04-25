LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY TBPrimeraEntrega IS
END TBPrimeraEntrega;
 
ARCHITECTURE behavior OF TBPrimeraEntrega IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PrimeraEntrega
    PORT(
         RST : IN  std_logic;
         CLK : IN  std_logic;
         DataOut : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
   --Inputs
   signal RST : std_logic := '0';
   signal CLK : std_logic := '0';
 	--Outputs
   signal DataOut : std_logic_vector(31 downto 0);
   -- Clock period definitions
   constant CLK_period : time := 10 ns;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: PrimerEntrega PORT MAP (
          RST => RST,
          CLK => CLK,
          DataOut => DataOut
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      wait;
   end process;

END;
