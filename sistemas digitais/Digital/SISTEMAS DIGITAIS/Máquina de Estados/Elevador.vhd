library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity SodaMachine is
    port (
        clk    : in  std_logic;
        reset  : in  std_logic;
        coin   : in  std_logic;
        dispense_out : out std_logic
    );
end entity SodaMachine;

architecture Behavioral of SodaMachine is

    type StateType is (IDLE, ACCEPT_COIN, DISPENSE);

    signal state : StateType;
    signal coin_accepted : std_logic;
    signal total_amount : integer range 0 to 4;  -- Valor acumulado em moedas (0-3, 0 representa R$0.00)

begin

    -- Lógica do controle da máquina
    process (clk, reset)
    begin
        if reset = '1' then
            state <= IDLE; -- Estado inicial
            coin_accepted <= '0';
            total_amount <= 0;
            dispense_out <= '0';
        elsif rising_edge(clk) then
            case state is
                when IDLE =>
                    if coin = '1' then
                        state <= ACCEPT_COIN;  -- Transição para o próximo estado
                        coin_accepted <= '0'; -- Inicializa a variável auxiliar
                        total_amount <= 1;
                        dispense_out <= '0';
                    end if;

                when ACCEPT_COIN =>
                    if coin = '1' then
                        coin_accepted <= '1';  -- Indica que a moeda foi aceita
                        total_amount <= total_amount + 1;  -- Incrementa o valor acumulado em 1
                    end if;

                    if total_amount = 3 then
                        state <= DISPENSE;  -- Transição para o estado de liberação
                        dispense_out <= '1';
                    else
                        state <= ACCEPT_COIN;  -- Continua aceitando moedas
                        dispense_out <= '0';
                    end if;
                    

                when DISPENSE =>
                    if coin = '1' then
                        state <= ACCEPT_COIN;  -- Retorna ao estado de aceitação de moedas
                        coin_accepted <= '0';
                        total_amount <= 0;
                        dispense_out <= '0';
                    end if;

                when others =>
                    state <= IDLE;
                    coin_accepted <= '0';
                    total_amount <= 0;
                    dispense_out <= '0';
            end case;
        end if;
    end process;

end architecture Behavioral;