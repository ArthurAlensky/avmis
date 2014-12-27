library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JKTrigger is
 port ( J : in  STD_LOGIC;
		  K : in  STD_LOGIC;
		  NRst : in  STD_LOGIC;
		  NSet : in  STD_LOGIC;
		  CLK : in  STD_LOGIC;
		  Q : out  STD_LOGIC;
		  NQ : out  STD_LOGIC);
end JKTrigger;



architecture JKT of JKTrigger is
begin

process(CLK, NRST, NSET) 
variable temp: std_logic:='0';
begin
if(NRST='0') then
	temp := '0';
elsif ( NSET = '0' ) then
	temp := '1';
elsif (CLK'event and CLK='1') then
		if (J='0' and K='0') then
			temp := temp;
		elsif (J='0' and K='1') then
			temp := '0';
		elsif (J='1' and K='0') then
			temp := '1';
		elsif (J='1' and K='1') then
			temp := not (temp);
		end if;
	end if;
	
	Q <= temp;
	NQ <= NOT temp;
end process;
end JKT;


