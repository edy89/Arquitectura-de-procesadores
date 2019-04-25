library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

ENTITY TB_Modulo1 IS
END TB_Modulo1;
ARCHITECTURE behavior OF TB_Modulo1 IS 
 
    COMPONENT Modulo1
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         DataIn : IN  std_logic_vector(31 downto 0);
         DataOut : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal datain : std_logic_vector(0 to 31) := (others => '0');
 	--Outputs
   signal dataout : std_logic_vector(0 to 31);
   -- Clock period definitions
   constant clk_period : time := 10 ns;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: Modulo1 PORT MAP (
          rst => rst,
          clk => clk,
          dataIn => datain,
          dataOut => dataout
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
      wait for 10 ns;	
      wait for clk_period*10;

			rst <= '0';
			DataIn <= "11111111111111111111111111111111";
			wait for 20 ns;
			
			rst <= '1';
			DataIn <= "11111111111111111111111111111111";
			wait for 20 ns;
			
			rst <= '0';
			DataIn <= "11111111111111111111111111111111";
			wait for 20 ns;
			
			rst <= '1';
			DataIn <= "11111111111111111111111111111111";
			wait for 20 ns;

      wait;
   end process;
END;
