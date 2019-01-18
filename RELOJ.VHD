LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY RELOJ IS
	
	PORT(hora_act	: IN	STD_LOGIC_VECTOR(4 downto 0);
		 min_act, seg_act: IN	STD_LOGIC_VECTOR(5 downto 0);
		 enable, reset: in std_logic;
		 clock_1Hz: in std_logic;
		 hora_sig		: OUT	STD_LOGIC_VECTOR(4 downto 0);
		 min_sig, seg_sig: OUT	STD_LOGIC_VECTOR(5 downto 0));

END RELOJ;

ARCHITECTURE a OF RELOJ IS

BEGIN
	PROCESS(reset,clock_1Hz) 
	BEGIN
		if reset='0' then hora_sig<="00000";min_sig<="000000";seg_sig<="000000";
		elsif clock_1Hz'event and clock_1Hz='1' then
			if enable='1'then
				if seg_act="111011" then
					if min_act="111011" then
						if hora_act = "10111" then
							hora_sig<="00000";
						else
							hora_sig<=hora_act+"00001";	
						end if;
						min_sig<="000000";
					else
						min_sig<=min_act+"000001";
						hora_sig<=hora_act;
					end if;
					seg_sig<="000000";
				else
					seg_sig<=seg_act+"000001";
					min_sig<=min_act;
					hora_sig<=hora_act;
				end if;
			else
				seg_sig<=seg_act;
				min_sig<=min_act;
				hora_sig<=hora_act;
			end if;
		end if;
	END PROCESS;
END a;