LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY cronometro IS
	PORT(reset,enable,clock_100Hz: IN STD_LOGIC;
		 minuto_act,segundo_act: In std_logic_vector(5 downto 0);
		 centiseg_act: In std_logic_vector(6 downto 0);
		 minuto,segundo: OUT std_logic_vector(5 downto 0);
		 centiseg: out std_logic_vector(6 downto 0));
END cronometro;

ARCHITECTURE sol OF cronometro IS

BEGIN
	process(reset,clock_100Hz)
	Begin
		if reset='0' then minuto<="000000"; segundo<="000000"; centiseg<="0000000";
		elsif clock_100Hz'event and clock_100Hz='1' then
			if enable='1' then
				if centiseg_act="1100011" then
					if segundo_act="111011" then
						if minuto_act = "111011" then
							minuto<="000000";
						else
							minuto<=minuto_act+"000001";	
						end if;
						segundo<="000000";
					else
						segundo<=segundo_act+"000001";
						minuto<=minuto_act;
					end if;
					centiseg<="0000000";
				else
					centiseg<=centiseg_act+"0000001";
					segundo<=segundo_act;
					minuto<=minuto_act;
				end if;
			else
				centiseg<=centiseg_act;
				segundo<=segundo_act;
				minuto<=minuto_act;
			end if;
		end if;
	end process;
end sol;
					
		
