library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity disp is
Port ( main_clk : in STD_LOGIC;
reg0 : in STD_LOGIC_vector(7 downto 0);
reg1 : in STD_LOGIC_vector(7 downto 0);
reg2 : in STD_LOGIC_vector(7 downto 0);
reg3 : in STD_LOGIC_vector(7 downto 0);
reg4 : in STD_LOGIC_vector(7 downto 0);
reg5 : in STD_LOGIC_vector(7 downto 0);
reg6 : in STD_LOGIC_vector(7 downto 0);
reg7 : in STD_LOGIC_vector(7 downto 0);
col : out STD_LOGIC_vector(7 downto 0);
row : out STD_LOGIC_vector(7 downto 0));
end disp;

architecture Behavioral of disp is

signal cnt_s : std_logic_vector(2 downto 0);
signal fila,colum : std_logic_vector(7 downto 0);

begin

process (main_clk)
begin
	if (main_clk'event and main_clk = '1') then
		if cnt_s="111" then
			cnt_s<="000";
		else
			cnt_s <= cnt_s + "001";
		end if;
	end if;
end process;

process (cnt_s)
begin
	if cnt_s = "000" then
		colum <= "10000000";
		fila <= reg0;
	elsif cnt_s = "001" then
		colum <= "01000000"; 
		fila <= reg1;
	elsif cnt_s = "010" then
		colum <= "00100000"; 
		fila <= reg2;
	elsif cnt_s = "011" then
		colum <= "00010000"; 
		fila <= reg3;
	elsif cnt_s = "100" then
		colum <= "00001000"; 
		fila <= reg4;
	elsif cnt_s = "101" then
		colum <= "00000100"; 
		fila <= reg5;
	elsif cnt_s = "110" then
		colum <= "00000010"; 
		fila <= reg6;
	elsif cnt_s = "111" then
		colum <= "00000001"; 
		fila <= reg7;
	end if;
end process;
col<=colum;
row<=fila;

end architecture Behavioral;