library ieee;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

entity BCDaFilas is
	port(BCD: in std_logic_vector(7 downto 0);
			fil0,fil1,fil2,fil3,fil4,fil5,fil6,fil7: out std_logic_vector(7 downto 0));
end BCDaFilas;

Architecture sol of BCDaFilas is
type arreglo is array (3 downto 0) of std_logic_vector(7 downto 0);
signal tablaA,tablaB : arreglo;
signal BCDA,BCDB: std_logic_vector(3 downto 0);
constant tabla0 : arreglo :=( -- datos del numero 0
						"10000010", 
						"10111010", 
						"10000010", 
						"11111110");

constant tabla1 : arreglo :=( -- datos del numero 1
						"10000010", 
						"11111110", 
						"11111110", 
						"11111110");

constant tabla2 : arreglo :=( -- datos del numero 2
						"10100010", 
						"10101010", 
						"10001010", 
						"11111110");

constant tabla3 : arreglo :=( -- datos del numero 3
						"10000010", 
						"10101010", 
						"10101010", 
						"11111110");

constant tabla4 : arreglo :=( -- datos del numero 4
						"10000010", 
						"11101110", 
						"11100010", 
						"11111110");
						
constant tabla5 : arreglo :=( -- datos del numero 5
						"10001010", 
						"10101010", 
						"10100010", 
						"11111110");

constant tabla6 : arreglo :=( -- datos del numero 6
						"10001010",
						"10101010",
						"10000010",
						"11111110");
			
constant tabla7 : arreglo :=( -- datos del numero 7
						"10000010", 
						"11111010", 
						"11111010", 
						"11111110");
						
constant tabla8 : arreglo :=( -- datos del numero 8
						"10000010", 
						"10101010", 
						"10000010", 
						"11111110");
						
constant tabla9 : arreglo :=( -- datos del numero 9
						"10000010", 
						"10101010", 
						"10100010", 
						"11111110");

constant tablaN : arreglo :=( -- otros casos
						"11111111", 
						"11111111", 
						"11111111", 
						"11111111");
						
begin


BCDA<=BCD(3)&BCD(2)&BCD(1)&BCD(0);
BCDB<=BCD(7)&BCD(6)&BCD(5)&BCD(4);

with BCDA select
	tablaA<= tabla0 when "0000",
				tabla1 when "0001",
				tabla2 when "0010",
				tabla3 when "0011",
				tabla4 when "0100",
				tabla5 when "0101",
				tabla6 when "0110",
				tabla7 when "0111",
				tabla8 when "1000",
				tabla9 when "1001",
				tablaN when others;
				
with BCDB select
	tablaB<= tabla0 when "0000",
				tabla1 when "0001",
				tabla2 when "0010",
				tabla3 when "0011",
				tabla4 when "0100",
				tabla5 when "0101",
				tabla6 when "0110",
				tabla7 when "0111",
				tabla8 when "1000",
				tabla9 when "1001",
				tablaN when others;

fil0<=tablaB(0);
fil1<=tablaB(1);
fil2<=tablaB(2);
fil3<=tablaB(3);
fil4<=tablaA(0);
fil5<=tablaA(1);
fil6<=tablaA(2);
fil7<=tablaA(3);

end sol;
				