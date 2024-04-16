library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity batalhanaval is
    port (
        sw      : in std_logic_vector(9 downto 0);
        key     : in std_logic_vector(3 downto 0);
        ledr    : out std_logic_vector(9 downto 0);
        ledg    : out std_logic_vector(7 downto 0);
        hex0    : out std_logic_vector(6 downto 0);
        hex1    : out std_logic_vector(6 downto 0);
        hex2    : out std_logic_vector(6 downto 0);
        hex3	 : out std_logic_vector(6 downto 0)
    );
end batalhanaval;

architecture batalhanaval_func of batalhanaval is
    
    type StateType is (COMECO, N1, N2, N3, INICIOJOGO, HEX, J);
    
    signal state : StateType;
    signal navio1, navio2, navio3 : std_logic_vector(3 downto 0);
    signal tiro : std_logic_vector(3 downto 0);
    signal jogada : integer range 0 to 5;
    signal acertos : integer range 0 to 2;

	function CONVERSOR (
		entrada : in std_logic_vector(3 downto 0))
		return std_logic_vector is
		variable saida : std_logic_vector(3 downto 0);
	begin
		if entrada = "0000" then
			saida := "0010";
		elsif entrada = "0001" then
			saida := "1111";
		elsif entrada = "0010" then
			saida := "1011";
		elsif entrada = "0011" then
			saida := "0110";
		elsif entrada = "0100" then
			saida := "1001";
		elsif entrada = "0101" then
			saida := "0111";
		elsif entrada = "0110" then
			saida := "0101";
		elsif entrada = "0111" then
			saida := "1000";
		elsif entrada = "1000" then
			saida := "0000";
		elsif entrada = "1001" then
			saida := "0001";
		elsif entrada = "1010" then
			saida := "0100";
		elsif entrada = "1011" then
			saida := "0011";
		elsif entrada = "1100" then
			saida := "1101";
		elsif entrada = "1101" then
			saida := "1110";
		elsif entrada = "1110" then
			saida := "1010";
		elsif entrada = "1111" then
			saida := "1100";
		end if;
		return saida;
	end function;

begin	
    process(key(0))
        
		variable auxnav, auxtiro : std_logic_vector(3 downto 0);
		variable coordenadas : std_logic_vector(3 downto 0);
        variable auxacerto: std_logic_vector(0 downto 0);

    begin
        if key(0) = '0' then
            hex0 <= "0111111";
            hex1 <= "0111111";
            hex2 <= "0111111";
            hex3 <= "0111111";
            ledg <= "00000000";
            ledr <= "0000000000";
			navio1 <= "0000";
			navio2 <= "0000";
			navio3 <= "0000";
            auxacerto := "0";
            state <= COMECO;

        elsif (key(3)'event and key(3) = '0') then
            case state is
                when COMECO =>
                    hex0 <= "0110000"; 
                    hex1 <= "1111111";
                    hex2 <= "1111111";
                    hex3 <= "1111111";
                    state <= N1;    
                    
                when N1 =>
		            hex0 <= "0100100"; 
                    hex1 <= "1111111";
                    hex2 <= "1111111";
                    hex3 <= "1111111";

                    for i in 0 to 3 loop
                        coordenadas(i) := sw(i);
                    end loop;

                    -- if key(3) = '0' then
                    --     coordenadas(0) := sw(9);
                    --     coordenadas(1) := sw(8);
                    --     coordenadas(2) := sw(7);
                    --     coordenadas(3) := sw(6);
                    -- end if;

                    auxnav := CONVERSOR(coordenadas);
                    navio1 <= auxnav;
						
                    state <= N2;

                when N2 =>  
		            hex0 <= "1111001";
                    hex1 <= "1111111";
                    hex2 <= "1111111";
                    hex3 <= "1111111";    

                    for i in 0 to 3 loop
                        coordenadas(i) := sw(i);
                    end loop;

					auxnav := CONVERSOR(coordenadas);
                    navio2 <= auxnav;

                    if (auxnav = navio1) then
                        hex3 <= "0000110";
                        hex2 <= "0101111";
                        hex1 <= "0101111";
                        hex0 <= "0100011";
                    else 
                        state <= N3;
                    end if;

                when N3 => 
                    hex0 <= "0111111"; 
                    hex1 <= "1111111";
                    hex2 <= "1111111";
                    hex3 <= "1111111";    

                    for i in 0 to 3 loop
                        coordenadas(i) := sw(i);
                    end loop;

                    auxnav := CONVERSOR(coordenadas);
                    navio3 <= auxnav;

                    if (auxnav = navio1 or auxnav = navio2) then
                        hex3 <= "0000110";
                        hex2 <= "0101111";
                        hex1 <= "0101111";
                        hex0 <= "0100011";
                    else
                        state <= INICIOJOGO;
                    end if;
                
                when INICIOJOGO =>
                    hex3 <= "0111111";
                    hex2 <= "0111111";
                    hex1 <= "0111111";
                    hex0 <= "0111111";
                    jogada <= 0;
                    acertos <= 0;
                    state <= HEX;

                when HEX =>
                    hex3 <= "1000000";
                    hex2 <= "1111111";
                    hex1 <= "1111111";
                    hex0 <= "0000010";
                    state <= J;
                
                when J =>
                    for i in 0 to 3 loop
                        coordenadas(i) := sw(i);
                    end loop;

                    auxtiro := CONVERSOR(coordenadas);
                    tiro <= auxtiro;

                    if auxtiro = navio1 then
                        jogada <= jogada + 1;
                        acertos <= acertos + 1;
                        auxacerto := "1";
                        ledg(7) <= '1';
                    elsif auxtiro = navio2 then
                        jogada <= jogada + 1;
                        acertos <= acertos + 1;
                        auxacerto := "1";
                        ledg(6) <= '1';
                    elsif auxtiro = navio3 then
                        jogada <= jogada + 1;
                        acertos <= acertos + 1;
                        auxacerto := "1";
                        ledg(5) <= '1';
                    else
                        jogada <= jogada + 1;
                        auxacerto := "0";
                    end if;

                    if jogada = 1 then
                        hex0 <= "0010010";
                    elsif jogada = 2 then
                        hex0 <= "0011001";
                    elsif jogada = 3 then
                        hex0 <= "0110000";
                    elsif jogada = 4 then
                        hex0 <= "0100100"; 
                    elsif jogada = 5 then
                        hex0 <= "1111001";
                    elsif jogada = 6 then
                        hex0 <= "1000000";
                    end if;

                    if acertos = 1 then
                        hex3 <= "1111001";
                    elsif acertos = 2 then
                        hex3 <= "0100100";
                    elsif acertos = 3 then
                        hex3 <= "0110000";
                    end if;

					if (jogada = 6) and (auxacerto = "1") and (acertos < 3) then
                        jogada <= jogada - 1;
					elsif (jogada = 6) and (auxacerto = "0") and (acertos < 3) then
                        hex3 <= "0000110";
                        hex2 <= "0101011";
                        hex1 <= "0100001";
                        hex0 <= "1111111";
                        ledr <= "1111111111";
                    elsif not (jogada = 6) and (acertos = 3) then
                        hex3 <= "0000110";
                        hex2 <= "0101011";
                        hex1 <= "0100001";
                        hex0 <= "1111111";
                        ledg <= "11111111";
                    end if;

            end case;
        end if;
    end process;
end batalhanaval_func;