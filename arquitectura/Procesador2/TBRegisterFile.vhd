LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_arith.ALL;
ENTITY TBRegisterFile IS
END TBRegisterFile;
ARCHITECTURE behavior OF TBRegisterFile IS 
    COMPONENT RegisterFile
    PORT(
         rs1 : IN  std_logic_vector(4 downto 0);
         rs2 : IN  std_logic_vector(4 downto 0);
         rd : IN  std_logic_vector(4 downto 0);
         rst : IN  std_logic;
         dwr : IN  std_logic_vector(31 downto 0);
         crs1 : OUT  std_logic_vector(31 downto 0);
         crs2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
   --Inputs
   signal rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal rd : std_logic_vector(4 downto 0) := (others => '0');
   signal rst : std_logic := '0';
   signal dwr : std_logic_vector(31 downto 0) := (others => '0');
 	--Outputs
   signal crs1 : std_logic_vector(31 downto 0);
   signal crs2 : std_logic_vector(31 downto 0);
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: RegisterFile PORT MAP (
          rs1 => rs1,
          rs2 => rs2,
          rd => rd,
          rst => rst,
          dwr => dwr,
          crs1 => crs1,
          crs2 => crs2
        );
   -- Stimulus process
   stim_proc: process
   begin		
      rs1 <= "00000";
		rs2 <= "00000";
		rd <= "00001";
		dwr <= "00000000000000000000000000011111";
		rst <= '0';
		wait for 40 ns;
		rs1 <= "00001";
		rs2 <= "00000";
		rd <= "00001";
		dwr <= "00000000000000000000000000000000";
		rst <= '0';
		wait for 40 ns;
		rs1 <= "00001";
		rs2 <= "00011";
		rd <= "00011";
		dwr <= "00000000000000000000000000000011";
		rst <= '0';
		wait for 40 ns;
		rs1 <= "00001";
		rs2 <= "00010";
		rd <= "00000";
		dwr <= "00000000000000000000000000000011";
		rst <= '0';
      wait;
   end process;
END;