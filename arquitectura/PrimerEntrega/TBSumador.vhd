LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.all;
ENTITY TBSumador IS
END TBSumador;
ARCHITECTURE behavior OF TBSumador IS 
    COMPONENT Sumador
    PORT(
         clk : IN  std_logic;
         DataIn1 : IN  std_logic_vector(31 downto 0);
         DataIn2 : IN  std_logic_vector(31 downto 0);
         DataOut : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
   --Inputs
   signal clk : std_logic := '0';
   signal DataIn1 : std_logic_vector(31 downto 0) := (others => '0');
   signal DataIn2 : std_logic_vector(31 downto 0) := (others => '0');
 	--Outputs
   signal DataOut : std_logic_vector(31 downto 0);
   -- Clock period definitions
   constant clk_period : time := 10 ns;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Sumador PORT MAP (
          clk => clk,
          DataIn1 => DataIn1,
          DataIn2 => DataIn2,
          DataOut => DataOut
        );
   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 20 ns;	
		DataIn1 <= "00000000000000000000000000000001";
		DataIn2 <= "00000000000000000000000000000010";
		wait for 20 ns;	
		DataIn1 <= "00000000000000000000000000000011";
		DataIn2 <= "00000000000000000000000000000011";
		wait for 20 ns;	
		DataIn1 <= "00000000000000000000000000000000";
		DataIn2 <= "00000000000000000000000000000010";
   end process;

END;
