LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

Entity segundero is
port(	reg0,reg1,reg2,reg3,reg4,reg5,reg6,reg7: in std_logic_vector(7 downto 0);
		fil0,fil1,fil2,fil3,fil4,fil5,fil6,fil7: out std_logic_vector(7 downto 0);
		ult_dig,enable: in std_logic);
end segundero;

Architecture sol of segundero is
 
Begin
	fil0<=reg0 when(enable='0') else (reg0(7)&reg0(6)&reg0(5)&reg0(4)&reg0(3)&reg0(2)&reg0(1)&ult_dig);
	fil1<=reg1 when(enable='0') else (reg1(7)&reg1(6)&reg1(5)&reg1(4)&reg1(3)&reg1(2)&reg1(1)&ult_dig);
	fil2<=reg2 when(enable='0') else (reg2(7)&reg2(6)&reg2(5)&reg2(4)&reg2(3)&reg2(2)&reg2(1)&ult_dig);
	fil3<=reg3 when(enable='0') else (reg3(7)&reg3(6)&reg3(5)&reg3(4)&reg3(3)&reg3(2)&reg3(1)&ult_dig);
	fil4<=reg4 when(enable='0') else (reg4(7)&reg4(6)&reg4(5)&reg4(4)&reg4(3)&reg4(2)&reg4(1)&ult_dig);
	fil5<=reg5 when(enable='0') else (reg5(7)&reg5(6)&reg5(5)&reg5(4)&reg5(3)&reg5(2)&reg5(1)&ult_dig);
	fil6<=reg6 when(enable='0') else (reg6(7)&reg6(6)&reg6(5)&reg6(4)&reg6(3)&reg6(2)&reg6(1)&ult_dig);
	fil7<=reg7 when(enable='0') else (reg7(7)&reg7(6)&reg7(5)&reg7(4)&reg7(3)&reg7(2)&reg7(1)&ult_dig);
end sol;
	