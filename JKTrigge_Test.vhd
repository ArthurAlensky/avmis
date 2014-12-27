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
         CLK : IN  std_logic;
         Q : OUT  std_logic;
         NQ : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal J : std_logic := '1';
   signal K : std_logic := '1';
   signal NRst : std_logic := '1';
   signal NSet : std_logic := '1';
   signal CLK : std_logic := '0';

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
          CLK => CLK,
          Q => Q,
          NQ => NQ
        );

-- Stimulus process
    CLK_proc: process
    begin		
        wait for 50 ns;
        CLK <= not CLK;		
    end process;
	

-- Stimulus process
    stim_proc: process
    begin         

        wait for 100 ns;


        NRst<='0';
        wait for 100 ns;


        NRst<='1';
        wait for 200 ns;

        NSet<='0';
        wait for 100 ns;

        NSet<='1';
        J<='0';
        wait for 100 ns;

        J<='1';
        K<='0';
        wait for 100 ns;
        
        K<='1';
        wait for 100 ns;
        
        NRst<='0';
        NSet<='0';
        J<='0';
        K<='0';
        wait;
    end process;

END;