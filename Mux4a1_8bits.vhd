LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY Mux4a1_8bits IS
	PORT(A0,B0,C0,D0,E0,F0,G0,H0: IN STD_LOGIC_vector(7 downto 0);
		 A1,B1,C1,D1,E1,F1,G1,H1: IN STD_LOGIC_vector(7 downto 0);
		 A2,B2,C2,D2,E2,F2,G2,H2: IN STD_LOGIC_vector(7 downto 0);
		 A3,B3,C3,D3,E3,F3,G3,H3: IN STD_LOGIC_vector(7 downto 0);
		 sel: in std_logic_vector(1 downto 0);
		 Reg0,Reg1,Reg2,Reg3,Reg4,Reg5,Reg6,Reg7: out STD_LOGIC_vector(7 downto 0));
		 
END Mux4a1_8bits;


ARCHITECTURE sol OF Mux4a1_8bits IS
begin
	with sel select 
	Reg0<= A0 when "00",
			A1 when "01",
			A2 when "10",
			A3 when "11";
	
	with sel select 	
	Reg1<= B0 when "00",
			B1 when "01",
			B2 when "10",
			B3 when "11";
	
	with sel select 
	Reg2<= C0 when "00",
			C1 when "01",
			C2 when "10",
			C3 when "11";
	
	with sel select 
	Reg3<= D0 when "00",
			D1 when "01",
			D2 when "10",
			D3 when "11";
			
	with sel select 
	Reg4<= E0 when "00",
			E1 when "01",
			E2 when "10",
			E3 when "11";
			
	with sel select 
	Reg5<= F0 when "00",
			F1 when "01",
			F2 when "10",
			F3 when "11";
			
	with sel select 
	Reg6<= G0 when "00",
			G1 when "01",
			G2 when "10",
			G3 when "11";
			
	with sel select 
	Reg7<= H0 when "00",
			H1 when "01",
			H2 when "10",
			H3 when "11";
end sol;