LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY JKTrigger_Test IS
END JKTrigger_Test;
 
ARCHITECTURE behavior OF JKTrigger_Test IS 
 
    COMPONENT JKTrigger
    PORT(
         J : IN  std_logic;
         K : IN  std_logic;
         NRst : IN  std_logic;
         NSet : IN  std_logic;
         C : IN  std_logic;
         Q : OUT  std_logic;
         NQ : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal J : std_logic := '1';
   signal K : std_logic := '1';
   signal NRst : std_logic := '1';
   signal NSet : std_logic := '1';
   signal C : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
   signal NQ : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant C_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: JKTrigger PORT MAP (
          J => J,
          K => K,
          NRst => NRst,
          NSet => NSet,
          C => C,
          Q => Q,
          NQ => NQ
        );

   -- Clock process definitions
   C_process :process
   begin
		C <= '0';
		wait for C_period/2;
		C <= '1';
		wait for C_period/2;
   end process;
 

   -- Stimulus process
   stim_proc_NRst: process
   begin		
		wait for 10ns;
		NRst <= '0';
		wait for 10ns;
		NRst <= '1';
		wait for 60ns;
   end process stim_proc_NRst;
	
	stim_proc_NSet: process
   begin		
		wait for 40ns;
		NSet<= '0';
		wait for 10ns;
		NSet <= '1';
		wait for 30ns;
   end process stim_proc_NSet;
	
	stim_proc_J: process
   begin		
		wait for 50ns;
		J <= '0';
		wait for 10ns;
		J <= '1';
		wait for 20ns;
   end process stim_proc_J;
	
	stim_proc_K: process
   begin		
		wait for 60ns;
		K <= '0';
		wait for 10ns;
		K <= '1';
		wait for 10ns;
   end process stim_proc_K;

END;