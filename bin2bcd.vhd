library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
entity bin2bcd is
    GENERIC(
        NBITS1  : integer :=  5; -- Cantidad de bits del número binario1.
		  NBITS2  : integer :=  5; -- Cantidad de bits del número binario2.
		  NBITS3  : integer :=  5; -- Cantidad de bits del número binario3.
		  NSALIDA: integer := 8  -- Cantidad de bits de salida en formato BCD.
    );
    PORT(
        num_bin1: in  STD_LOGIC_VECTOR(NBITS1-1   downto 0);
		  num_bin2: in  STD_LOGIC_VECTOR(NBITS2-1   downto 0);
		  num_bin3: in  STD_LOGIC_VECTOR(NBITS3-1   downto 0);
        num_bcd1,num_bcd2,num_bcd3: out STD_LOGIC_VECTOR(NSALIDA-1 downto 0)
    );
end bin2bcd;
 
architecture Behavioral of bin2bcd is
begin
    proceso_bcd1: process(num_bin1)
        variable z1: STD_LOGIC_VECTOR(NBITS1+NSALIDA-1 downto 0);
    begin
        -- Inicialización de datos en cero.
        z1 := (others => '0');
        -- Se realizan los primeros tres corrimientos.
        z1(NBITS1+2 downto 3) := num_bin1;
        -- Ciclo para las iteraciones restantes.
        for i in 0 to NBITS1-4 loop
            -- Unidades (4 bits).
            if z1(NBITS1+3 downto NBITS1) > 4 then
                z1(NBITS1+3 downto NBITS1) := z1(NBITS1+3 downto NBITS1) + 3;
            end if;
            -- Decenas (4 bits).
            if z1(NBITS1+7 downto NBITS1+4) > 4 then
                z1(NBITS1+7 downto NBITS1+4) := z1(NBITS1+7 downto NBITS1+4) + 3;
            end if;
            z1(NBITS1+NSALIDA-1 downto 1) := z1(NBITS1+NSALIDA-2 downto 0);
        end loop;
        -- Pasando datos de variable Z, correspondiente a BCD.
        num_bcd1 <= z1(NBITS1+NSALIDA-1 downto NBITS1);
    end process;
	 
	 proceso_bcd2: process(num_bin2)
        variable z2: STD_LOGIC_VECTOR(NBITS2+NSALIDA-1 downto 0);
    begin
        -- Inicialización de datos en cero.
        z2 := (others => '0');
        -- Se realizan los primeros tres corrimientos.
        z2(NBITS2+2 downto 3) := num_bin2;
        -- Ciclo para las iteraciones restantes.
        for j in 0 to NBITS2-4 loop
            -- Unidades (4 bits).
            if z2(NBITS2+3 downto NBITS2) > 4 then
                z2(NBITS2+3 downto NBITS2) := z2(NBITS2+3 downto NBITS2) + 3;
            end if;
            -- Decenas (4 bits).
            if z2(NBITS2+7 downto NBITS2+4) > 4 then
                z2(NBITS2+7 downto NBITS2+4) := z2(NBITS2+7 downto NBITS2+4) + 3;
            end if;
            z2(NBITS2+NSALIDA-1 downto 1) := z2(NBITS2+NSALIDA-2 downto 0);
        end loop;
        -- Pasando datos de variable Z, correspondiente a BCD.
        num_bcd2 <= z2(NBITS2+NSALIDA-1 downto NBITS2);
    end process;
	 
	 proceso_bcd3: process(num_bin3)
        variable z3: STD_LOGIC_VECTOR(NBITS3+NSALIDA-1 downto 0);
    begin
        -- Inicialización de datos en cero.
        z3 := (others => '0');
        -- Se realizan los primeros tres corrimientos.
        z3(NBITS3+2 downto 3) := num_bin3;
        -- Ciclo para las iteraciones restantes.
        for k in 0 to NBITS3-4 loop
            -- Unidades (4 bits).
            if z3(NBITS3+3 downto NBITS3) > 4 then
                z3(NBITS3+3 downto NBITS3) := z3(NBITS3+3 downto NBITS3) + 3;
            end if;
            -- Decenas (4 bits).
            if z3(NBITS3+7 downto NBITS3+4) > 4 then
                z3(NBITS3+7 downto NBITS3+4) := z3(NBITS3+7 downto NBITS3+4) + 3;
            end if;
            z3(NBITS3+NSALIDA-1 downto 1) := z3(NBITS3+NSALIDA-2 downto 0);
        end loop;
        -- Pasando datos de variable Z, correspondiente a BCD.
        num_bcd3 <= z3(NBITS3+NSALIDA-1 downto NBITS3);
    end process;
	 
end Behavioral;