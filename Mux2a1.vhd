LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY mux2a1 IS
	PORT(A1: IN STD_LOGIC_vector(4 downto 0);
		 B1,C1: IN STD_LOGIC_vector(5 downto 0);
		 A2: IN STD_LOGIC_vector(4 downto 0);
		 B2,C2: IN STD_LOGIC_vector(5 downto 0);
		 sel: in std_logic;
		 hora_act: out STD_LOGIC_vector(4 downto 0);
		 min_act,seg_act: out STD_LOGIC_vector(5 downto 0));
		 
END mux2a1;


ARCHITECTURE sol OF mux2a1 IS
begin
	hora_act<= A1 when (sel='0') else A2;
	min_act<= B1 when (sel='0') else B2;
	seg_act<= C1 when (sel='0') else C2;
end sol;