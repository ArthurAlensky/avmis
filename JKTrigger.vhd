library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JKTrigger is
 port ( J : in  STD_LOGIC;
		  K : in  STD_LOGIC;
		  NRst : in  STD_LOGIC;
		  NSet : in  STD_LOGIC;
		  C : in  STD_LOGIC;
		  Q : out  STD_LOGIC;
		  NQ : out  STD_LOGIC);
end JKTrigger;



architecture JKT of JKTrigger is
signal Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8: std_logic;
begin

process(NRST, NSET, C) begin

	IF NRST = '0' and NSET = '0' THEN
		Q1 <= 'X';
	ELSIF	(NRST = '0') THEN
		Q1 <= '0';
	ELSIF NSET = '0' THEN
		Q1 <= '1';
	ELSIF (C'EVENT AND C = '1' AND J = '1' AND K = '1') THEN
		Q1 <= NOT Q1;
	ELSIF (C'EVENT AND C = '1' AND J = '1' AND K = '0') THEN
		Q1 <= '1';
	ELSIF (C'EVENT AND C = '1' AND J = '0' AND K = '1') THEN
		Q1 <= '0';
	END IF;	
end process;
Q <= Q1;
NQ <= NOT Q1;
end JKT;


