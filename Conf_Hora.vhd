LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY Conf_Hora IS
	PORT(reset, clock: std_logic;
		 hora_act: in std_logic_vector(4 downto 0);
		 min_act: in std_logic_vector(5 downto 0);
		 enable_h,enable_m: in std_logic;
		 hora: out std_logic_vector(4 downto 0);
		 min: out std_logic_vector(5 downto 0));
END Conf_Hora;

ARCHITECTURE sol OF Conf_Hora IS
BEGIN
	Process (reset, clock)
	Begin
		if reset='0' then hora<="00000";min<="000000";
		elsif clock'event and clock='1' then
			if enable_h='1' then
				if hora_act = "10111" then
					hora<="00000";
				else
					hora<=hora_act+"00001";
				end if;
			else
				hora<=hora_act;
			end if;
			if enable_m='1' then
				if min_act = "111011" then
					min<="000000";
				else
					min<=min_act+"000001";
				end if;
			else
				min<=min_act;
			end if;
		end if;
	end process;
end sol;
	