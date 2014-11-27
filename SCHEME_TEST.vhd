--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:41:49 11/04/2014
-- Design Name:   
-- Module Name:   E:/inf/LabaTwo/SCHEME_TEST.vhd
-- Project Name:  LabaTwo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SCHEME
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
USE std.textio.all;
USE ieee.std_logic_textio.all;

 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY SCHEME_TEST IS
END SCHEME_TEST;
 
ARCHITECTURE behavior OF SCHEME_TEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SCHEME
    PORT(
         G : IN  std_logic;
         not_G : IN  std_logic;
         not_CCLR : IN  std_logic;
         CCKEN : IN  std_logic;
         not_CCKEN : IN  std_logic;
         CCK : IN  std_logic;
         not_CLOAD : IN  std_logic;
         not_RCKEN : IN  std_logic;
         RCK : IN  std_logic;
         not_RCO : OUT  std_logic;
         Q : INOUT  std_logic_vector(8 downto 1)

        );
    END COMPONENT;
    



 --Inputs
   signal G : std_logic := '1';
   signal not_G : std_logic := '0';
   signal not_CCLR : std_logic := '0';
   signal CCKEN : std_logic := '0';
   signal not_CCKEN : std_logic := '0';
   signal CCK : std_logic := '0';
   signal not_CLOAD : std_logic := '1';
   signal not_RCKEN : std_logic := '1';
   signal RCK : std_logic := '0';

	--BiDirs
   signal Q : std_logic_vector(8 downto 1);

 	--Outputs
   signal not_RCO : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clock_period : time := 50 ns;
	
	
procedure Clock(signal C: out std_logic; HT, LT: TIME) is
 begin
    loop  -- schedule "waveform" on C and suspend for period
		C <= '1' after LT,  '0' after LT + HT; wait for LT + HT;
    end loop; 
end procedure;

procedure ReadSignalsFromFile(InLine : std_logic_vector (9 downto 1);
										OutLine: std_logic_vector (9 downto 1);
										signal G : out std_logic;
										signal not_G : out std_logic;
										signal not_CCLR : out std_logic;
										signal CCKEN : out std_logic;
										signal not_CCKEN : out std_logic;
										signal CCK : out std_logic;
										signal not_CLOAD : out std_logic;
										signal not_RCKEN : out std_logic;
										signal RCK : out std_logic) is
   
 begin
			G <= InLine(9);
			not_G <= InLine(8);
         not_CCLR <= InLine(7);
         CCKEN <= InLine(6);
         not_CCKEN <= InLine(5);
         CCK <= InLine(4);
         not_CLOAD <= InLine(3);
         not_RCKEN <= InLine(2);
         RCK <= InLine(1);

end procedure;

procedure WriteSignalsToFile(InLine : out std_logic_vector (9 downto 1);
										OutLine: out std_logic_vector (9 downto 1);
										signal G : in std_logic;
										signal not_G : in std_logic;
										signal not_CCLR : in std_logic;
										signal CCKEN : in std_logic;
										signal not_CCKEN : in std_logic;
										signal CCK : in std_logic;
										signal not_CLOAD : in std_logic;
										signal not_RCKEN : in std_logic;
										signal RCK : in std_logic;
										signal Q: in std_logic_vector;
										signal not_RCO : in std_logic) is
   
 begin
		InLine(9) := G;
		InLine(8) := not_G;
		InLine(7) := not_CCLR;
		InLine(6) := CCKEN;
		InLine(5) := not_CCKEN;
		InLine(4) := CCK;
		InLine(3) := not_CLOAD;
		InLine(2) := not_RCKEN;
		InLine(1) := RCK;

		OutLine(9 downto 2) := Q;
		OutLine(1) := not_RCO;

end procedure;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SCHEME PORT MAP (
          G => G,
          not_G => not_G,
          not_CCLR => not_CCLR,
          CCKEN => CCKEN,
          not_CCKEN => not_CCKEN,
          CCK => CCK,
          not_CLOAD => not_CLOAD,
          not_RCKEN => not_RCKEN,
          RCK => RCK,
          not_RCO => not_RCO,
          Q => Q
        );


----    Stimulus process
--   stim_proc: process
--	file TestFile : text open read_mode is "Counter_test_var.txt";
--	variable Buff : line;
--	variable InLine : std_logic_vector (9 downto 1);
--   variable OutLine: std_logic_vector (9 downto 1);
--   begin		
--		readline(TestFile, Buff);
--		read(Buff, inLine);
--		read(Buff, outLine);
--		ReadSignalsFromFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK);
--		Q <= outLine(9 downto 2);
--		
--		
--		wait for 30 ns;
--		readline(TestFile, Buff);
--		read(Buff, inLine);
--		read(Buff, outLine);
--		ReadSignalsFromFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK);
--		wait for 5 ns;
--		assert Q = outLine(9 downto 2) and not_RCO = OutLine(1)
--				report "Test error!"
--				severity error;
--		--not_CCLR <= '1'; 
--		
--		wait for 100 ns;
--		readline(TestFile, Buff);
--		read(Buff, inLine);
--		read(Buff, outLine);
--		ReadSignalsFromFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK);
--		wait for 5 ns;
--		assert Q = outLine(9 downto 2) and not_RCO = OutLine(1)
--				report "Test error!"
--				severity error;
--		--not_G <= '1';
--		
--		wait for 10 ns;
--		readline(TestFile, Buff);
--		read(Buff, inLine);
--		read(Buff, outLine);
--		ReadSignalsFromFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK);
--		Q <= outLine(9 downto 2);
--		
--		wait for 50 ns;
--		readline(TestFile, Buff);
--		read(Buff, inLine);
--		read(Buff, outLine);
--		ReadSignalsFromFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK);
--		wait for 5 ns;
--		assert Q = outLine(9 downto 2) and not_RCO = OutLine(1)
--				report "Test error!"
--				severity error;
--		--not_RCKEN <= '0';
--		
--		wait for 20 ns;
--		readline(TestFile, Buff);
--		read(Buff, inLine);
--		read(Buff, outLine);
--		ReadSignalsFromFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK);
-- 		--G <= '0';
--		wait for 5 ns;
--		assert Q = outLine(9 downto 2) and not_RCO = OutLine(1)
--				report "Test error!"
--				severity error;
--				
--		wait for 20 ns;
--		readline(TestFile, Buff);
--		read(Buff, inLine);
--		read(Buff, outLine);
--		ReadSignalsFromFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK);
--		--RCK <= '1';
--		wait for 5 ns;
--		assert Q = outLine(9 downto 2) and not_RCO = OutLine(1)
--				report "Test error!"
--				severity error;
--		
--		wait for 10 ns;
--		readline(TestFile, Buff);
--		read(Buff, inLine);
--		read(Buff, outLine);
--		ReadSignalsFromFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK);
--		--not_RCKEN <= '1';
--		wait for 5 ns;
--		assert Q = outLine(9 downto 2) and not_RCO = OutLine(1)
--				report "Test error!"
--				severity error;
--		
--
--		wait for 30 ns;
--		readline(TestFile, Buff);
--		read(Buff, inLine);
--		read(Buff, outLine);
--		ReadSignalsFromFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK);
--		wait for 5 ns;
--		assert Q = outLine(9 downto 2) and not_RCO = OutLine(1)
--				report "Test error!"
--				severity error;
--		--not_G <= '0';
--		
--		wait for 5 ns;
--		readline(TestFile, Buff);
--		read(Buff, inLine);
--		read(Buff, outLine);
--		ReadSignalsFromFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK);
--		wait for 5 ns;
--		assert Q = outLine(9 downto 2) and not_RCO = OutLine(1)
--				report "Test error!"
--				severity error;
--		--not_CLOAD <= '0';
--		--K <= '0';
--		
--		wait for 10 ns;
--      readline(TestFile, Buff);
--		read(Buff, inLine);
--		read(Buff, outLine);
--		ReadSignalsFromFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK);
--		wait for 5 ns;
--		assert Q = outLine(9 downto 2) and not_RCO = OutLine(1)
--				report "Test error!"
--				severity error;
--	   --not_CLOAD <= '1';
--
--		wait for 10 ns;
--		readline(TestFile, Buff);
--		read(Buff, inLine);
--		read(Buff, outLine);
--		ReadSignalsFromFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK);
--		Q <= outLine(9 downto 2);
--		
--		wait for 10 ns;
--		readline(TestFile, Buff);
--		read(Buff, inLine);
--		read(Buff, outLine);
--		ReadSignalsFromFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK);
--		wait for 5 ns;
--		assert Q = outLine(9 downto 2) and not_RCO = OutLine(1)
--				report "Test error!"
--				severity error;
--		--G <= '1';
--		
--		wait for 90 ns;
--		readline(TestFile, Buff);
--		read(Buff, inLine);
--		read(Buff, outLine);
--		ReadSignalsFromFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK);
--		wait for 5 ns;
--		assert Q = outLine(9 downto 2) and not_RCO = OutLine(1)
--				report "Test error!"
--				severity error;
--		--not_CCKEN <= '1';
--		
--		wait for 20 ns;
--		readline(TestFile, Buff);
--		read(Buff, inLine);
--		read(Buff, outLine);
--		ReadSignalsFromFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK);
--		wait for 5 ns;
--		assert Q = outLine(9 downto 2) and not_RCO = OutLine(1)
--				report "Test error!"
--				severity error;
--		
--		wait for 50 ns;
--		readline(TestFile, Buff);
--		read(Buff, inLine);
--		read(Buff, outLine);
--		ReadSignalsFromFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK);
--		wait for 5 ns;
--		assert Q = outLine(9 downto 2) and not_RCO = OutLine(1)
--				report "Test error!"
--				severity error;
--		--CCKEN <= '1';
--		
--		wait for 50 ns;
--		readline(TestFile, Buff);
--		read(Buff, inLine);
--		read(Buff, outLine);
--		ReadSignalsFromFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK);
--		wait for 5 ns;
--		assert Q = outLine(9 downto 2) and not_RCO = OutLine(1)
--				report "Test error!"
--				severity error;
--		--not_CCKEN <= '0';
--
--		while not endfile(TestFile)
--		loop
--			wait for clock_period/2;
--		
--			readline(TestFile, Buff);
--			read(Buff, inLine);
--			read(Buff, outLine);
--			ReadSignalsFromFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK);
--			--wait for 5 ns;
--			assert Q = outLine(9 downto 2) and not_RCO = OutLine(1)
--				report "Test error!"
--				severity error;
--		end loop;
--      wait;
--   end process;

--	triggers_test: process
--	file TestFile : text open read_mode is "1.txt";
--	variable Buff : line;
--	variable InLine : std_logic_vector (9 downto 1);
--	variable OutLine: std_logic_vector (9 downto 1);
--   begin	
--
--		for i in 0 to 255 loop
--	
--		G <= '1';
--		not_G <= '0';
--		not_CCLR <= '0';
--		CCKEN <= '0';
--		not_CCKEN <= '0';
--		CCK <= '0';
--		not_CLOAD <= '1';
--		not_RCKEN <= '1';
--		RCK <= '0';
--	
--		wait for 5 ns;
--	
--		Q(1) <= '0';
--		Q(2) <= '0';
--		Q(3) <= '0';
--		Q(4) <= '0';
--		Q(5) <= '0';
--		Q(6) <= '0';
--		Q(7) <= '0';
--		Q(8) <= '0';
--		
--		
--		wait for 30 ns;
--		not_CCLR <= '1';
--		
--		wait for 100 ns;
--		not_G <= '1';
--		
--		wait for 10 ns;
--		readline(TestFile, Buff);
--		read(Buff, inLine);
--		read(Buff, outLine);
--		Q <= outLine(9 downto 2);
--		
--		wait for 50 ns;
--		not_RCKEN <= '0';
--		
--		wait for 20 ns;
-- 		G <= '0';
--		
--		wait for 20 ns;
--		RCK <= '1';
--		
--		wait for 10 ns;
--		not_RCKEN <= '1';
--
--		wait for 30 ns;
--		not_G <= '0';
--	
--		wait for 5 ns;
--		not_CLOAD <= '0';		
--		RCK <= '0';
--		
--		wait for 10 ns;
--	   not_CLOAD <= '1';
--
--		wait for 10 ns;
--		Q(1) <= 'Z';
--		Q(2) <= 'Z';
--		Q(3) <= 'Z';
--		Q(4) <= 'Z';
--		Q(5) <= 'Z';
--		Q(6) <= 'Z';
--		Q(7) <= 'Z';
--		Q(8) <= 'Z';
--		
--		wait for 10 ns;
--		G <= '1';
--		
--		wait for 90 ns;
--		not_CCKEN <= '1';
--		
--		wait for 50 ns;
--		CCKEN <= '1';
--		
--		wait for 50 ns;
--		not_CCKEN <= '0';
--		
--		wait for 5 ns;
--		
--		assert Q = outLine(9 downto 2)
--				report "Test error!"
--				severity error;
--		
--		end loop;
--		
--		
--      wait;
--	end process;

 
----    Stimulus process
--stim_proc: process
--	file TestFile : text open write_mode is "Counter_test_var.txt";
--	variable OutputBuf : line;
--	variable InLine : std_logic_vector (9 downto 1);
--	variable OutLine: std_logic_vector (9 downto 1);
--   begin		
--		Q(1) <= '0';
--		Q(2) <= '0';
--		Q(3) <= '0';
--		Q(4) <= '0';
--		Q(5) <= '0';
--		Q(6) <= '0';
--		Q(7) <= '0';
--		Q(8) <= '0';
--		
--		wait for 5 ns;
--		WriteSignalsToFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK, Q, not_RCO);
--		write(OutputBuf, std_logic_vector'(inLine));
--		write(OutputBuf, std_logic_vector'(outLine));
--		writeline(TestFile, OutputBuf);
--		
--		
--		wait for 30 ns;
--		not_CCLR <= '1';
--		wait for 5 ns;
--		WriteSignalsToFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK, Q, not_RCO);
--		write(OutputBuf, std_logic_vector'(inLine));
--		write(OutputBuf, std_logic_vector'(outLine));
--		writeline(TestFile, OutputBuf);		
--		
--		wait for 100 ns;
--		not_G <= '1';
--		wait for 5 ns;
--		WriteSignalsToFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK, Q, not_RCO);
--		write(OutputBuf, std_logic_vector'(inLine));
--		write(OutputBuf, std_logic_vector'(outLine));
--		writeline(TestFile, OutputBuf);
--		
--		wait for 10 ns;
--		Q(1) <= '0';
--		Q(2) <= '0';
--		Q(3) <= '1';
--		Q(4) <= '0';
--		Q(5) <= '1';
--		Q(6) <= '1';
--		Q(7) <= '1';
--		Q(8) <= '0';
--		wait for 5 ns;
--		WriteSignalsToFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK, Q , not_RCO);
--		write(OutputBuf, std_logic_vector'(inLine));
--		write(OutputBuf, std_logic_vector'(outLine));
--		writeline(TestFile, OutputBuf);
--		
--		wait for 50 ns;
--		not_RCKEN <= '0';
--		wait for 5 ns;
--		WriteSignalsToFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK, Q , not_RCO);
--		write(OutputBuf, std_logic_vector'(inLine));
--		write(OutputBuf, std_logic_vector'(outLine));
--		writeline(TestFile, OutputBuf);
--		
--		wait for 20 ns;
-- 		G <= '0';
--		wait for 5 ns;
--		WriteSignalsToFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK, Q , not_RCO);
--		write(OutputBuf, std_logic_vector'(inLine));
--		write(OutputBuf, std_logic_vector'(outLine));
--		writeline(TestFile, OutputBuf);
--		
--		wait for 20 ns;
--		RCK <= '1';
--		wait for 5 ns;
--		WriteSignalsToFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK, Q , not_RCO);
--		write(OutputBuf, std_logic_vector'(inLine));
--		write(OutputBuf, std_logic_vector'(outLine));
--		writeline(TestFile, OutputBuf);
--		
--		wait for 10 ns;
--		not_RCKEN <= '1';
--		wait for 5 ns;
--		WriteSignalsToFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK, Q , not_RCO);
--		write(OutputBuf, std_logic_vector'(inLine));
--		write(OutputBuf, std_logic_vector'(outLine));
--		writeline(TestFile, OutputBuf);
--
--		wait for 30 ns;
--		not_G <= '0';
--		wait for 5 ns;
--		WriteSignalsToFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK, Q , not_RCO);
--		write(OutputBuf, std_logic_vector'(inLine));
--		write(OutputBuf, std_logic_vector'(outLine));
--		writeline(TestFile, OutputBuf);
--	
--		wait for 5 ns;
--		not_CLOAD <= '0';		
--		RCK <= '0';
--		wait for 5 ns;
--		WriteSignalsToFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK, Q , not_RCO);
--		write(OutputBuf, std_logic_vector'(inLine));
--		write(OutputBuf, std_logic_vector'(outLine));
--		writeline(TestFile, OutputBuf);
--		
--		wait for 10 ns;
--	   not_CLOAD <= '1';
--		wait for 5 ns;
--		WriteSignalsToFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK, Q , not_RCO);
--		write(OutputBuf, std_logic_vector'(inLine));
--		write(OutputBuf, std_logic_vector'(outLine));
--		writeline(TestFile, OutputBuf);
--
--		wait for 10 ns;
--		Q(1) <= 'Z';
--		Q(2) <= 'Z';
--		Q(3) <= 'Z';
--		Q(4) <= 'Z';
--		Q(5) <= 'Z';
--		Q(6) <= 'Z';
--		Q(7) <= 'Z';
--		Q(8) <= 'Z';
--		wait for 5 ns;
--		WriteSignalsToFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK, Q , not_RCO);
--		write(OutputBuf, std_logic_vector'(inLine));
--		write(OutputBuf, std_logic_vector'(outLine));
--		writeline(TestFile, OutputBuf);
--		
--		wait for 10 ns;
--		G <= '1';
--		wait for 5 ns;
--		WriteSignalsToFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK, Q , not_RCO);
--		write(OutputBuf, std_logic_vector'(inLine));
--		write(OutputBuf, std_logic_vector'(outLine));
--		writeline(TestFile, OutputBuf);
--		
--		wait for 90 ns;
--		not_CCKEN <= '1';
--		wait for 5 ns;
--		WriteSignalsToFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK, Q , not_RCO);
--		write(OutputBuf, std_logic_vector'(inLine));
--		write(OutputBuf, std_logic_vector'(outLine));
--		writeline(TestFile, OutputBuf);
--		
--		wait for 50 ns;
--		CCKEN <= '1';
--		wait for 5 ns;
--		WriteSignalsToFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK, Q , not_RCO);
--		write(OutputBuf, std_logic_vector'(inLine));
--		write(OutputBuf, std_logic_vector'(outLine));
--		writeline(TestFile, OutputBuf);
--		
--		wait for 50 ns;
--		not_CCKEN <= '0';
--		wait for 5 ns;
--		WriteSignalsToFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK, Q , not_RCO);
--		write(OutputBuf, std_logic_vector'(inLine));
--		write(OutputBuf, std_logic_vector'(outLine));
--		writeline(TestFile, OutputBuf);
--      wait;
--   end process;
--	
--	clock_process: process 
--	begin
--		wait for 400 ns;
--		Clock(CCK, clock_period/2, clock_period/2);
--	end process;
--	
--	process(CCK) is
--	file TestFile : text open write_mode is "Counter_test_var_1.txt";
--	variable OutputBuf : line;
--	variable InLine : std_logic_vector (9 downto 1);
--	variable OutLine: std_logic_vector (9 downto 1);
--	begin
--		WriteSignalsToFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK, Q , not_RCO);
--		write(OutputBuf, std_logic_vector'(inLine));
--		write(OutputBuf, std_logic_vector'(outLine));
--		writeline(TestFile, OutputBuf);
--	end process;

trigger_write_test: process
	file TestFile : text open write_mode is "write_triggers.txt";
	file QFile : text open read_mode is "1.txt";
	variable OutputBuf : line;
	variable Buff : line;
	variable InLine : std_logic_vector (9 downto 1);
	variable OutLine: std_logic_vector (9 downto 1);
begin
	for i in 0 to 256 loop
	
		G <= '1';
		not_G <= '0';
		not_CCLR <= '0';
		CCKEN <= '0';
		not_CCKEN <= '0';
		CCK <= '0';
		not_CLOAD <= '1';
		not_RCKEN <= '1';
		RCK <= '0';
		
		wait for 5 ns;
	
		WriteSignalsToFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK, Q, not_RCO);
		write(OutputBuf, std_logic_vector'(inLine));
		write(OutputBuf, std_logic_vector'(outLine));
		writeline(TestFile, OutputBuf);
	
		wait for 5 ns;
	
		Q(1) <= '0';
		Q(2) <= '0';
		Q(3) <= '0';
		Q(4) <= '0';
		Q(5) <= '0';
		Q(6) <= '0';
		Q(7) <= '0';
		Q(8) <= '0';
		
		wait for 5 ns;
		
		WriteSignalsToFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK, Q, not_RCO);
		write(OutputBuf, std_logic_vector'(inLine));
		write(OutputBuf, std_logic_vector'(outLine));
		writeline(TestFile, OutputBuf);
		
		wait for 5 ns;
		WriteSignalsToFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK, Q, not_RCO);
		write(OutputBuf, std_logic_vector'(inLine));
		write(OutputBuf, std_logic_vector'(outLine));
		writeline(TestFile, OutputBuf);
		
		
		wait for 30 ns;
		not_CCLR <= '1';
		wait for 5 ns;
		WriteSignalsToFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK, Q, not_RCO);
		write(OutputBuf, std_logic_vector'(inLine));
		write(OutputBuf, std_logic_vector'(outLine));
		writeline(TestFile, OutputBuf);		
		
		wait for 100 ns;
		not_G <= '1';
		wait for 5 ns;
		WriteSignalsToFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK, Q, not_RCO);
		write(OutputBuf, std_logic_vector'(inLine));
		write(OutputBuf, std_logic_vector'(outLine));
		writeline(TestFile, OutputBuf);
		
		wait for 10 ns;
		
		readline(QFile, Buff);
		read(Buff, inLine);
		read(Buff, outLine);
		Q <= outLine(9 downto 2);
		
		wait for 5 ns;
		
		WriteSignalsToFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK, Q , not_RCO);
		write(OutputBuf, std_logic_vector'(inLine));
		write(OutputBuf, std_logic_vector'(outLine));
		writeline(TestFile, OutputBuf);
		
		wait for 50 ns;
		not_RCKEN <= '0';
		wait for 5 ns;
		WriteSignalsToFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK, Q , not_RCO);
		write(OutputBuf, std_logic_vector'(inLine));
		write(OutputBuf, std_logic_vector'(outLine));
		writeline(TestFile, OutputBuf);
		
		wait for 20 ns;
 		G <= '0';
		wait for 5 ns;
		WriteSignalsToFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK, Q , not_RCO);
		write(OutputBuf, std_logic_vector'(inLine));
		write(OutputBuf, std_logic_vector'(outLine));
		writeline(TestFile, OutputBuf);
		
		wait for 20 ns;
		RCK <= '1';
		wait for 5 ns;
		WriteSignalsToFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK, Q , not_RCO);
		write(OutputBuf, std_logic_vector'(inLine));
		write(OutputBuf, std_logic_vector'(outLine));
		writeline(TestFile, OutputBuf);
		
		wait for 10 ns;
		not_RCKEN <= '1';
		wait for 5 ns;
		WriteSignalsToFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK, Q , not_RCO);
		write(OutputBuf, std_logic_vector'(inLine));
		write(OutputBuf, std_logic_vector'(outLine));
		writeline(TestFile, OutputBuf);

		wait for 30 ns;
		not_G <= '0';
		wait for 5 ns;
		WriteSignalsToFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK, Q , not_RCO);
		write(OutputBuf, std_logic_vector'(inLine));
		write(OutputBuf, std_logic_vector'(outLine));
		writeline(TestFile, OutputBuf);
	
		wait for 5 ns;
		not_CLOAD <= '0';		
		RCK <= '0';
		wait for 5 ns;
		WriteSignalsToFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK, Q , not_RCO);
		write(OutputBuf, std_logic_vector'(inLine));
		write(OutputBuf, std_logic_vector'(outLine));
		writeline(TestFile, OutputBuf);
		
		wait for 10 ns;
	   not_CLOAD <= '1';
		wait for 5 ns;
		WriteSignalsToFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK, Q , not_RCO);
		write(OutputBuf, std_logic_vector'(inLine));
		write(OutputBuf, std_logic_vector'(outLine));
		writeline(TestFile, OutputBuf);

		wait for 10 ns;
		Q(1) <= 'Z';
		Q(2) <= 'Z';
		Q(3) <= 'Z';
		Q(4) <= 'Z';
		Q(5) <= 'Z';
		Q(6) <= 'Z';
		Q(7) <= 'Z';
		Q(8) <= 'Z';
		wait for 5 ns;
		WriteSignalsToFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK, Q , not_RCO);
		write(OutputBuf, std_logic_vector'(inLine));
		write(OutputBuf, std_logic_vector'(outLine));
		writeline(TestFile, OutputBuf);
		
		wait for 10 ns;
		G <= '1';
		wait for 5 ns;
		WriteSignalsToFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK, Q , not_RCO);
		write(OutputBuf, std_logic_vector'(inLine));
		write(OutputBuf, std_logic_vector'(outLine));
		writeline(TestFile, OutputBuf);
		
		wait for 90 ns;
		not_CCKEN <= '1';
		wait for 5 ns;
		WriteSignalsToFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK, Q , not_RCO);
		write(OutputBuf, std_logic_vector'(inLine));
		write(OutputBuf, std_logic_vector'(outLine));
		writeline(TestFile, OutputBuf);
		
		wait for 50 ns;
		CCKEN <= '1';
		wait for 5 ns;
		WriteSignalsToFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK, Q , not_RCO);
		write(OutputBuf, std_logic_vector'(inLine));
		write(OutputBuf, std_logic_vector'(outLine));
		writeline(TestFile, OutputBuf);
		
		wait for 50 ns;
		not_CCKEN <= '0';
		wait for 5 ns;
		WriteSignalsToFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK, Q , not_RCO);
		write(OutputBuf, std_logic_vector'(inLine));
		write(OutputBuf, std_logic_vector'(outLine));
		writeline(TestFile, OutputBuf);
	
	end loop;
	wait;
end process;


--trigger_read_test: process
--	file TestFile : text open read_mode is "write_triggers.txt";
--	variable OutputBuf : line;
--	variable Buff : line;
--	variable InLine : std_logic_vector (9 downto 1);
--	variable OutLine: std_logic_vector (9 downto 1);
--begin
--	for i in 0 to 255 loop
--	
--		readline(TestFile, Buff);
--		read(Buff, inLine);
--		read(Buff, outLine);
--		ReadSignalsFromFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK);
--		Q <= outLine(9 downto 2);
--		
--		wait for 5 ns;
--	
--		readline(TestFile, Buff);
--		read(Buff, inLine);
--		read(Buff, outLine);
--		ReadSignalsFromFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK);
--	
--		wait for 5 ns;
--	
--		readline(TestFile, Buff);
--		read(Buff, inLine);
--		read(Buff, outLine);
--		ReadSignalsFromFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK);
--		Q <= outLine(9 downto 2);
--		
--		wait for 30 ns;
--		readline(TestFile, Buff);
--		read(Buff, inLine);
--		read(Buff, outLine);
--		ReadSignalsFromFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK);
--		
--		wait for 100 ns;
--		readline(TestFile, Buff);
--		read(Buff, inLine);
--		read(Buff, outLine);
--		ReadSignalsFromFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK);
--		
--		wait for 10 ns;
--		
--		readline(TestFile, Buff);
--		read(Buff, inLine);
--		read(Buff, outLine);
--		ReadSignalsFromFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK);
--		Q <= outLine(9 downto 2);
--		
--		wait for 50 ns;
--		readline(TestFile, Buff);
--		read(Buff, inLine);
--		read(Buff, outLine);
--		ReadSignalsFromFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK);
--		
--		wait for 20 ns;
-- 		readline(TestFile, Buff);
--		read(Buff, inLine);
--		read(Buff, outLine);
--		ReadSignalsFromFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK);
--	
--		
--		wait for 20 ns;
--		readline(TestFile, Buff);
--		read(Buff, inLine);
--		read(Buff, outLine);
--		ReadSignalsFromFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK);
--		
--		wait for 10 ns;
--		readline(TestFile, Buff);
--		read(Buff, inLine);
--		read(Buff, outLine);
--		ReadSignalsFromFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK);
--
--		wait for 30 ns;
--		readline(TestFile, Buff);
--		read(Buff, inLine);
--		read(Buff, outLine);
--		ReadSignalsFromFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK);
--	
--		wait for 5 ns;
--		readline(TestFile, Buff);
--		read(Buff, inLine);
--		read(Buff, outLine);
--		ReadSignalsFromFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK);
--		
--		wait for 10 ns;
--	   readline(TestFile, Buff);
--		read(Buff, inLine);
--		read(Buff, outLine);
--		ReadSignalsFromFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK);
--
--		wait for 10 ns;
--		readline(TestFile, Buff);
--		read(Buff, inLine);
--		read(Buff, outLine);
--		ReadSignalsFromFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK);
--		Q <= outLine(9 downto 2);
--		
--		wait for 10 ns;
--		readline(TestFile, Buff);
--		read(Buff, inLine);
--		read(Buff, outLine);
--		ReadSignalsFromFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK);
--		
--		wait for 90 ns;
--		readline(TestFile, Buff);
--		read(Buff, inLine);
--		read(Buff, outLine);
--		ReadSignalsFromFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK);
--		
--		wait for 50 ns;
--		readline(TestFile, Buff);
--		read(Buff, inLine);
--		read(Buff, outLine);
--		ReadSignalsFromFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK);
--		
--		wait for 50 ns;
--		readline(TestFile, Buff);
--		read(Buff, inLine);
--		read(Buff, outLine);
--		ReadSignalsFromFile(inLine, outLine, G, not_G, not_CCLR, CCKEN, not_CCKEN, CCK, not_CLOAD, not_RCKEN, RCK);
--	
--		wait for 5 ns;
--		
--		assert Q = outLine(9 downto 2)
--				report "Test error!"
--				severity error;
--	
--	end loop;
--	wait;
--end process;

END;