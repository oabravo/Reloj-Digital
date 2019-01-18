library ieee;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.ALL;

entity Reloj_Arena is
	port(min: in std_logic_vector(5 downto 0);
			ult_dig: in std_logic;
			fil_0,fil_1,fil_2,fil_3,fil_4,fil_5,fil_6,fil_7: out std_logic_vector(7 downto 0);
			fil2_0,fil2_1,fil2_2,fil2_3,fil2_4,fil2_5,fil2_6,fil2_7: out std_logic_vector(7 downto 0));
end REloj_Arena;

Architecture sol of Reloj_Arena is
type arreglo is array (15 downto 0) of std_logic_vector(7 downto 0);
signal tabla : arreglo;

signal tabla00_03min : arreglo :=( -- datos del numero reloj de arena entre 0 y 3 minutos
								"00000000", 
								"011"&(not(ult_dig))&(ult_dig)&"110", 
								"011"&(ult_dig)&(not(ult_dig))&"110",
								"011"&(not(ult_dig))&(ult_dig)&"110",
								"011"&(ult_dig)&(not(ult_dig))&"110",
								"101"&(not(ult_dig))&(ult_dig)&"101",
								"110"&(ult_dig)&(not(ult_dig))&"011",
								"11100111",
								"11100111",
								"11000011",
								"10000001",
								"00000000",
								"00000000",
								"00000000",
								"00000000",
								"00000000");

signal tabla04_07min : arreglo :=( -- datos del reloj de arena entre 4 y 7 minutos
								"00000000", 
								"01100110", 
								"011"&(ult_dig)&(not(ult_dig))&"110",
								"011"&(not(ult_dig))&(ult_dig)&"110",
								"011"&(ult_dig)&(not(ult_dig))&"110",
								"101"&(not(ult_dig))&(ult_dig)&"101",
								"110"&(ult_dig)&(not(ult_dig))&"011",
								"11100111",
								"11100111",
								"11000011",
								"10000001",
								"00000000",
								"00000000",
								"00000000",
								"00011000",
								"00000000");

signal tabla08_11min : arreglo :=( -- datos del reloj de arena entre 8 y 11 minutos
								"00000000", 
								"01000010", 
								"011"&(ult_dig)&(not(ult_dig))&"110",
								"011"&(not(ult_dig))&(ult_dig)&"110",
								"011"&(ult_dig)&(not(ult_dig))&"110",
								"101"&(not(ult_dig))&(ult_dig)&"101",
								"110"&(ult_dig)&(not(ult_dig))&"011",
								"11100111",
								"11100111",
								"11000011",
								"10000001",
								"00000000",
								"00000000",
								"00000000",
								"00111100",
								"00000000");

signal tabla12_15min : arreglo :=( -- datos del reloj de arena entre 12 y 15 minutos
								"00000000", 
								"01000010", 
								"01100110",
								"011"&(not(ult_dig))&(ult_dig)&"110",
								"011"&(ult_dig)&(not(ult_dig))&"110",
								"101"&(not(ult_dig))&(ult_dig)&"101",
								"110"&(ult_dig)&(not(ult_dig))&"011",
								"11100111",
								"11100111",
								"11000011",
								"10000001",
								"00000000",
								"00000000",
								"00011000",
								"00111100",
								"00000000");

signal tabla16_19min : arreglo :=( -- datos del reloj de arena entre 16 y 19 minutos
								"00000000", 
								"00000000", 
								"01100110",
								"011"&(not(ult_dig))&(ult_dig)&"110",
								"011"&(ult_dig)&(not(ult_dig))&"110",
								"101"&(not(ult_dig))&(ult_dig)&"101",
								"110"&(ult_dig)&(not(ult_dig))&"011",
								"11100111",
								"11100111",
								"11000011",
								"10000001",
								"00000000",
								"00000000",
								"00011000",
								"01111110",
								"00000000");
						
signal tabla20_23min : arreglo :=( -- datos del reloj de arena entre 20 y 23 minutos
								"00000000", 
								"00000000", 
								"01000010",
								"011"&(not(ult_dig))&(ult_dig)&"110",
								"011"&(ult_dig)&(not(ult_dig))&"110",
								"101"&(not(ult_dig))&(ult_dig)&"101",
								"110"&(ult_dig)&(not(ult_dig))&"011",
								"11100111",
								"11100111",
								"11000011",
								"10000001",
								"00000000",
								"00000000",
								"00111100",
								"01111110",
								"00000000");

signal tabla24_27min : arreglo :=( -- datos del reloj de arena entre 24 y 27 minutos
								"00000000", 
								"00000000", 
								"01000010",
								"01100110",
								"011"&(ult_dig)&(not(ult_dig))&"110",
								"101"&(not(ult_dig))&(ult_dig)&"101",
								"110"&(ult_dig)&(not(ult_dig))&"011",
								"11100111",
								"11100111",
								"11000011",
								"10000001",
								"00000000",
								"00011000",
								"00111100",
								"01111110",
								"00000000");

signal tabla28_31min : arreglo :=( -- datos del reloj de arena entre 28 y 31 minutos
								"00000000", 
								"00000000", 
								"00000000",
								"01100110",
								"011"&(ult_dig)&(not(ult_dig))&"110",
								"101"&(not(ult_dig))&(ult_dig)&"101",
								"110"&(ult_dig)&(not(ult_dig))&"011",
								"11100111",
								"11100111",
								"11000011",
								"10000001",
								"00000000",
								"00011000",
								"01111110",
								"01111110",
								"00000000");

signal tabla32_35min : arreglo :=( -- datos del reloj de arena entre 32 y 35 minutos
								"00000000", 
								"00000000", 
								"00000000",
								"01000010",
								"011"&(ult_dig)&(not(ult_dig))&"110",
								"101"&(not(ult_dig))&(ult_dig)&"101",
								"110"&(ult_dig)&(not(ult_dig))&"011",
								"11100111",
								"11100111",
								"11000011",
								"10000001",
								"00000000",
								"00111100",
								"01111110",
								"01111110",
								"00000000");

signal tabla36_39min : arreglo :=( -- datos del reloj de arena entre 36 y 39 minutos
								"00000000", 
								"00000000", 
								"00000000",
								"01000010",
								"01100110",
								"101"&(not(ult_dig))&(ult_dig)&"101",
								"110"&(ult_dig)&(not(ult_dig))&"011",
								"11100111",
								"11100111",
								"11000011",
								"10000001",
								"00011000",
								"00111100",
								"01111110",
								"01111110",
								"00000000");
						
signal tabla40_43min : arreglo :=( -- datos del reloj de arena entre 40 y 43 minutos
								"00000000", 
								"00000000", 
								"00000000",
								"00000000",
								"01100110",
								"101"&(not(ult_dig))&(ult_dig)&"101",
								"110"&(ult_dig)&(not(ult_dig))&"011",
								"11100111",
								"11100111",
								"11000011",
								"10000001",
								"00011000",
								"01111110",
								"01111110",
								"01111110",
								"00000000");

signal tabla44_47min : arreglo :=( -- datos del reloj de arena entre 44 y 47 minutos
								"00000000", 
								"00000000", 
								"00000000",
								"00000000",
								"01000010",
								"101"&(not(ult_dig))&(ult_dig)&"101",
								"110"&(ult_dig)&(not(ult_dig))&"011",
								"11100111",
								"11100111",
								"11000011",
								"10000001",
								"00111100",
								"01111110",
								"01111110",
								"01111110",
								"00000000");

signal tabla48_51min : arreglo :=( -- datos del reloj de arena entre 48 y 51 minutos
								"00000000", 
								"00000000", 
								"00000000",
								"00000000",
								"01000010",
								"10100101",
								"110"&(ult_dig)&(not(ult_dig))&"011",
								"11100111",
								"11100111",
								"11000011",
								"10011001",
								"00111100",
								"01111110",
								"01111110",
								"01111110",
								"00000000");

signal tabla52_55min : arreglo :=( -- datos del reloj de arena entre 52 y 55 minutos
								"00000000", 
								"00000000", 
								"00000000",
								"00000000",
								"00000000",
								"10100101",
								"110"&(ult_dig)&(not(ult_dig))&"011",
								"11100111",
								"11100111",
								"11000011",
								"10011001",
								"01111110",
								"01111110",
								"01111110",
								"01111110",
								"00000000");

signal tabla56_59min : arreglo :=( -- datos del reloj de arena entre 56 y 59 minutos
								"00000000", 
								"00000000", 
								"00000000",
								"00000000",
								"00000000",
								"10000001",
								"110"&(ult_dig)&(not(ult_dig))&"011",
								"11100111",
								"11100111",
								"11000011",
								"10111101",
								"01111110",
								"01111110",
								"01111110",
								"01111110",
								"00000000");	

begin


tabla<=  tabla00_03min when (min>="000000" and min<"000100") else
			tabla04_07min when (min>="000100" and min<"001000") else
			tabla08_11min when (min>="001000" and min<"001100") else
			tabla12_15min when (min>="001100" and min<"010000") else
			tabla16_19min when (min>="010000" and min<"010100") else
			tabla20_23min when (min>="010100" and min<"011000") else
			tabla24_27min when (min>="011000" and min<"011100") else
			tabla28_31min when (min>="011100" and min<"100000") else
			tabla32_35min when (min>="100000" and min<"100100") else
			tabla36_39min when (min>="100100" and min<"101000") else
			tabla40_43min when (min>="101000" and min<"101100") else
			tabla44_47min when (min>="101100" and min<"110000") else
			tabla48_51min when (min>="110000" and min<"110100") else
			tabla52_55min when (min>="110100" and min<"111000") else
			tabla56_59min when (min>="111000" and min<"111100");

fil_0<=tabla(0);
fil_1<=tabla(1);
fil_2<=tabla(2);
fil_3<=tabla(3);
fil_4<=tabla(4);
fil_5<=tabla(5);
fil_6<=tabla(6);
fil_7<=tabla(7);
fil2_0<=tabla(8);
fil2_1<=tabla(9);
fil2_2<=tabla(10);
fil2_3<=tabla(11);
fil2_4<=tabla(12);
fil2_5<=tabla(13);
fil2_6<=tabla(14);
fil2_7<=tabla(15);

end sol;
				