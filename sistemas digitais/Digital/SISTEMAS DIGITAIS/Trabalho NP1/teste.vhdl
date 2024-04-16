library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ent is
	port( 
        entrada1: in std_logic_vector(3 downto 0);
        entrada2: in std_logic_vector(3 downto 0);
	    saida : out std_logic_vector(3 downto 0)
        ); 
end ent;

architecture arch of ent is

    signal x, y: integer;
    signal soma: integer;

    begin
        x <= to_integer(unsigned(entrada1));
        y <= to_integer(unsigned(entrada2));
        
        soma <= x + y;

        saida <= std_logic_vector(to_unsigned(soma, 4));
	
end arch;
