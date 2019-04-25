LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.all;
ENTITY sumadortestbench IS
END sumadortestbench;
ARCHITECTURE behavior OF sumadortestbench IS 
    COMPONENT sumador
    PORT(
         clk : IN  std_logic;
         datain1 : IN  std_logic_vector(31 downto 0);
         datain2 : IN  std_logic_vector(31 downto 0);
         dataout : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
   --Inputs
   signal clk : std_logic := '0';
   signal datain1 : std_logic_vector(31 downto 0) := (others => '0');
   signal datain2 : std_logic_vector(31 downto 0) := (others => '0');
 	--Outputs
   signal dataout : std_logic_vector(31 downto 0);
   -- Clock period definitions
   constant clk_period : time := 10 ns;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sumador PORT MAP (
          clk => clk,
          datain1 => datain1,
          datain2 => datain2,
          dataout => dataout
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
		datain1 <= "00000000000000000000000000000001";
		datain2 <= "00000000000000000000000000000010";
		wait for 20 ns;	
		datain1 <= "00000000000000000000000000000011";
		datain2 <= "00000000000000000000000000000011";
		wait for 20 ns;	
		datain1 <= "00000000000000000000000000000000";
		datain2 <= "00000000000000000000000000000010";
   end process;

END;
