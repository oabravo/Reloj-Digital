library ieee;
use ieee.std_logic_1164.all;

entity inicial is
	port(A0,A1,A2,A3,A4,A5,A6,A7: out std_logic_vector(7 downto 0));
end inicial;

architecture generar of inicial is
begin
A0<="11001101";
A1<="10101000";
A2<="01101101";
A3<="01101111";
A4<="01101111";
A5<="01101101";
A6<="10101000";
A7<="11001101";
end generar;