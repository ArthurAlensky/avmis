----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:29:16 11/04/2014 
-- Design Name: 
-- Module Name:    SCHEME - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SCHEME is
 port ( 
		G     	 : in STD_LOGIC;
		not_G 	 : in STD_LOGIC;
		not_CCLR  : in STD_LOGIC;
 		CCKEN     : in STD_LOGIC;
		not_CCKEN : in STD_LOGIC;
		CCK       : in STD_LOGIC;
		not_CLOAD : in STD_LOGIC;
		not_RCKEN : in STD_LOGIC;
		RCK       : in STD_LOGIC;
		not_RCO   : out STD_LOGIC;
      Q         : inout  STD_LOGIC_VECTOR (8 downto 1)
		);
end SCHEME;

architecture Behavioral of SCHEME is

	signal DQ: std_logic_vector(8 downto 1);
	signal NDQ: std_logic_vector(8 downto 1);
	signal R: std_logic_vector(8 downto 1);
	signal S: std_logic_vector(8 downto 1);
	signal NX: std_logic_vector(8 downto 1);
	signal X: std_logic_vector(8 downto 1);

	signal NOT_Q : std_logic_vector(8 downto 1);
	signal CLK_vector : std_logic_vector(8 downto 1);

  signal signal_G_notG        : STD_LOGIC;
  signal signal_CCKEN_Not_CCK : STD_LOGIC;
  signal signal_Not_CCLR		: STD_LOGIC;
  signal signal_Not_CLOAD     : STD_LOGIC;	
  signal signal_A 				:STD_LOGIC;
  signal signal_B 				:STD_LOGIC;
  signal signal_C 				:STD_LOGIC;
  signal signal_impuls 			: STD_LOGIC;



COMPONENT JK_FF 
 port ( J : in  STD_LOGIC;
		  K : in  STD_LOGIC;
		  CLK : in  STD_LOGIC;
		  RST : in  STD_LOGIC;
		  SET : in  STD_LOGIC;
		  Q : out  STD_LOGIC;
		  nQ : out  STD_LOGIC
		  );
end COMPONENT;



begin
			signal_G_notG <= G and (not not_G);
			signal_CCKEN_Not_CCK <= (NOT CCK)  OR ((not_CCKEN OR (NOT CCKEN)));
			signal_impuls <= RCK AND( NOT not_RCKEN );
			
			NOT_Q(8) <= NOT Q(8);
			NOT_Q(7) <= NOT Q(7);
			NOT_Q(6) <= NOT Q(6);
			NOT_Q(5) <= NOT Q(5);
			NOT_Q(4) <= NOT Q(4);
			NOT_Q(3) <= NOT Q(3);
			NOT_Q(2) <= NOT Q(2);
			NOT_Q(1) <= NOT Q(1);
				
D1: JK_FF
PORT MAP(J => Q(1), K => NOT_Q(1), CLK => signal_impuls, SET => '1', RST => '1', Q => DQ(1), NQ => NDQ(1));
D2: JK_FF
PORT MAP(J => Q(2), K => NOT_Q(2), CLK => signal_impuls, SET => '1', RST => '1', Q => DQ(2), NQ => NDQ(2));
D3: JK_FF
PORT MAP(J => Q(3), K => NOT_Q(3), CLK => signal_impuls, SET => '1', RST => '1', Q => DQ(3), NQ => NDQ(3));
D4: JK_FF
PORT MAP(J => Q(4), K => NOT_Q(4), CLK => signal_impuls, SET => '1', RST => '1', Q => DQ(4), NQ => NDQ(4));
D5: JK_FF
PORT MAP(J => Q(5), K => NOT_Q(5), CLK => signal_impuls, SET => '1', RST => '1', Q => DQ(5), NQ => NDQ(5));
D6: JK_FF
PORT MAP(J => Q(6), K => NOT_Q(6), CLK => signal_impuls, SET => '1', RST => '1', Q => DQ(6), NQ => NDQ(6));
D7: JK_FF
PORT MAP(J => Q(7), K => NOT_Q(7), CLK => signal_impuls, SET => '1', RST => '1', Q => DQ(7), NQ => NDQ(7));
D8: JK_FF
PORT MAP(J => Q(8), K => NOT_Q(8), CLK => signal_impuls, SET => '1', RST => '1', Q => DQ(8), NQ => NDQ(8));
			
S(1) <= DQ(1) NAND (NOT not_CLOAD);
S(2) <= DQ(2) NAND (NOT not_CLOAD);
S(3) <= DQ(3) NAND (NOT not_CLOAD);
S(4) <= DQ(4) NAND (NOT not_CLOAD);
S(5) <= DQ(5) NAND (NOT not_CLOAD);
S(6) <= DQ(6) NAND (NOT not_CLOAD);
S(7) <= DQ(7) NAND (NOT not_CLOAD);
S(8) <= DQ(8) NAND (NOT not_CLOAD);		

R(1) <= (NOT (NDQ(1) NAND (NOT not_CLOAD))) NOR (NOT not_CCLR);
R(2) <= (NOT (NDQ(2) NAND (NOT not_CLOAD))) NOR (NOT not_CCLR);
R(3) <= (NOT (NDQ(3) NAND (NOT not_CLOAD))) NOR (NOT not_CCLR);
R(4) <= (NOT (NDQ(4) NAND (NOT not_CLOAD))) NOR (NOT not_CCLR);
R(5) <= (NOT (NDQ(5) NAND (NOT not_CLOAD))) NOR (NOT not_CCLR);
R(6) <= (NOT (NDQ(6) NAND (NOT not_CLOAD))) NOR (NOT not_CCLR);
R(7) <= (NOT (NDQ(7) NAND (NOT not_CLOAD))) NOR (NOT not_CCLR);
R(8) <= (NOT (NDQ(8) NAND (NOT not_CLOAD))) NOR (NOT not_CCLR);



CLK_vector(1) <= NOT signal_CCKEN_Not_CCK;
CLK_vector(2) <= NOT (X(1) AND signal_CCKEN_Not_CCK);
CLK_vector(3) <= NOT (X(1) AND X(2) AND signal_CCKEN_Not_CCK);
CLK_vector(4) <= NOT (X(1) AND X(2) AND X(3) AND signal_CCKEN_Not_CCK);
CLK_vector(5) <= NOT (X(1) AND X(2) AND X(3) AND X(4) AND signal_CCKEN_Not_CCK);
CLK_vector(6) <= NOT (X(1) AND X(2) AND X(3) AND X(4) AND X(5) AND signal_CCKEN_Not_CCK);
CLK_vector(7) <= NOT (X(1) AND X(2) AND X(3) AND X(4) AND X(5) AND X(6) AND signal_CCKEN_Not_CCK);
CLK_vector(8) <= NOT (X(1) AND X(2) AND X(3) AND X(4) AND X(5) AND X(6) AND X(7) AND signal_CCKEN_Not_CCK);


RS1: JK_FF
PORT MAP(J => '1', K =>  '1', CLK => CLK_vector(1), SET => S(1), RST => R(1), Q => X(1), NQ => NX(1));
RS2: JK_FF
PORT MAP(J => '1', K => '1', CLK => CLK_vector(2), SET => S(2), RST => R(2), Q => X(2), NQ => NX(2));
RS3: JK_FF
PORT MAP(J => '1', K => '1', CLK => CLK_vector(3), SET => S(3), RST => R(3), Q => X(3), NQ => NX(3));
RS4: JK_FF
PORT MAP(J => '1', K => '1', CLK => CLK_vector(4), SET => S(4), RST => R(4), Q => X(4), NQ => NX(4));
RS5: JK_FF
PORT MAP(J => '1', K => '1', CLK => CLK_vector(5), SET => S(5), RST => R(5), Q => X(5), NQ => NX(5));
RS6: JK_FF
PORT MAP(J => '1', K => '1', CLK => CLK_vector(6), SET => S(6), RST => R(6), Q => X(6), NQ => NX(6));
RS7: JK_FF
PORT MAP(J => '1', K => '1', CLK => CLK_vector(7), SET => S(7), RST => R(7), Q => X(7), NQ => NX(7));
RS8: JK_FF
PORT MAP(J => '1', K => '1', CLK => CLK_vector(8), SET => S(8), RST => R(8), Q => X(8), NQ => NX(8));

Q(1) <= (NOT NX(1)) WHEN signal_G_notG = '1' ELSE 'Z';
Q(2) <= (NOT NX(2)) WHEN signal_G_notG = '1' ELSE 'Z';
Q(3) <= (NOT NX(3)) WHEN signal_G_notG = '1' ELSE 'Z';
Q(4) <= (NOT NX(4)) WHEN signal_G_notG = '1' ELSE 'Z';
Q(5) <= (NOT NX(5)) WHEN signal_G_notG = '1' ELSE 'Z';
Q(6) <= (NOT NX(6)) WHEN signal_G_notG = '1' ELSE 'Z';
Q(7) <= (NOT NX(7)) WHEN signal_G_notG = '1' ELSE 'Z';
Q(8) <= (NOT NX(8)) WHEN signal_G_notG = '1' ELSE 'Z';


not_RCO <= NOT (X(1) AND X(2) AND X(3) AND X(4) AND X(5) AND X(6) AND X(7) AND X(8));


end Behavioral;

