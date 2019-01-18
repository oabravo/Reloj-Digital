LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY controlador IS
	PORT(clock,reset,set,start,cambiar,cambiar_vis,modo: IN STD_LOGIC;
		 enable_Reg_RH,enable_Reg_RM: OUT STD_LOGIC;
		 enable_Reloj,enable_crono,reset_crono: OUT STD_LOGIC;
		 reloj_crono_arena:out std_logic_vector(1 downto 0);
		 Estados: OUT STD_LOGIC_VECTOR(4 downto 0));
END controlador;

ARCHITECTURE sol OF controlador IS
Type estado is (Ta,Tb,Tc,Td,Tdc,Te,Tf,Tg,Tgf,Th,Ti,Tj,Tk,Tki,Tl,Tm,Tn,Too,Tp,Tq,Tr,Ts,Tt,Tu);
SIGNAL y:estado;
SIGNAL bandera: STD_LOGIC;
BEGIN
	PROCESS(clock,reset)
	BEGIN
		if reset='0' then bandera<='0';enable_Reloj<='0';y<=Ta;reloj_crono_arena<="00";
  		elsif (clock'event and clock='1') then
			case y is
				when Ta=> 	if modo='1' then
								y<=Tb;
								else
								y<=Ta;
								end if;
				when Tb=>	if modo='1' then 
								y<=Tb;
								else
								reloj_crono_arena<="01";
								y<=Tc;
								end if;
				when Tc=>	if set='1' then y<=Td;
								elsif cambiar='1' then y<=Te;
								else
								y<=Tc;
								end if;
				when Td=>	if set='1' then
								y<=Td;
								else 
								y<=Tdc;
								end if;
				when Tdc=>  y<=Tc;
				when Te=>	if cambiar='1' then 
								y<=Te;
								else
								y<=Tf;
								end if;
				when Tf=>	if set='1' then y<=Tg;
								elsif cambiar='1' then y<=Th;
								else
								y<=Tf;
								end if;
				when Tg=>	if set='1' then y<=Tg;
								else
								y<=Tgf;
								end if;
				when Tgf=>  y<=Tf;
				when Th=>	if cambiar='1' then y<=Th;
								else
								enable_Reloj<='1';
								y<=Ti;
								end if;
				when Ti=>	if modo='1' then y<=Tj;
								elsif cambiar_vis='1' then 
								y<=Ts;
								else
								y<=Ti;
								end if;
				when Tj=>	if modo='1' then y<=Tj;
								elsif bandera='1' then 
								reloj_crono_arena<="10";
								y<=Too;
								else
								reloj_crono_arena<="10";
								bandera<='0';
								y<=Tk;
								end if;
				when Tk=>	if start='1' then y<=Tl;
								elsif modo='1' then y<=Tki;
								else	
								y<=Tk;
								end if;
				when Tki=>	if modo='1' then y<=Tki;
								else
								reloj_crono_arena<="01";
								y<=Ti;
								end if;
				when Tl=>	if start='1' then y<=Tl;
								else
								enable_crono<='1';
								y<=Tm;
								end if;
				when Tm=>	if set='1' then y<=Tn;
								else
								y<=Tm;
								end if;
				when Tn=>	if set='1' then y<=Tn;
								else
								bandera<='1';
								enable_crono<='0';
								y<=Too;
								end if;
				when Too=>	if start='1' then y<=Tp;
								elsif modo='1' then y<=Tr;
								elsif set='1' then y<=Tq;
								else
								y<=Too;
								end if;
				when Tp=>	if start='1' then y<=Tp;
								else
								enable_crono<='1';
								y<=Tm;
								end if;
				when Tq=>	if set='1' then y<=Tq;
								else
								bandera<='0';
								y<=Tk;
								end if;
				when Tr=>	if modo='1' then y<=Tr;
								else
								reloj_crono_arena<="01";
								y<=Ti;
								end if;
				when Ts=>	if cambiar_vis='1' then y<=Ts;
								else
								reloj_crono_arena<="11";
								y<=Tt;
								end if;
				when Tt=>	if cambiar_vis='1' then y<=Tu;
								else 
								y<=Tt;
								end if;
				when Tu=>	if cambiar_vis='1' then y<=Tu;
								else
								reloj_crono_arena<="01";
								y<=Ti;
								end if;
			end case;
		end if;
	END PROCESS;
	
PROCESS(y)
	BEGIN
		enable_Reg_RH<='0';enable_Reg_RM<='0'; reset_crono<='1';
			case y is
				when Ta=>	Estados<="11111"; 
				when Tb=>	Estados<="00001"; 
				when Tc=>	Estados<="00010"; 
				when Td=>	Estados<="00011"; 
				when Tdc=>  Estados<="00100"; enable_Reg_RH<='1';
				when Te=>	Estados<="00101"; 
				when Tf=>	Estados<="00110"; 
				when Tg=>	Estados<="00111";
				when Tgf=>  Estados<="01000"; enable_Reg_RM<='1';
				when Th=>	Estados<="01001"; 
				when Ti=>	Estados<="01010"; 
				when Tj=>	Estados<="01011";	
				when Tk=>	Estados<="01100";	reset_crono<='0';
				when Tki=>	Estados<="01101";
				when Tl=>	Estados<="01110";	
				when Tm=>	Estados<="01111";	
				when Tn=>	Estados<="10000";	
				when Too=>	Estados<="10001"; 
				when Tp=>	Estados<="10010"; 
				when Tq=>	Estados<="10011"; 
				when Tr=>	Estados<="10100";
				when Ts=>	Estados<="10101";
				when Tt=>	Estados<="10110";
				when Tu=>	Estados<="10111";
			end case;
	END PROCESS;
END sol;