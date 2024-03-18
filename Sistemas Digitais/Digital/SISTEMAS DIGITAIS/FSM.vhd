library ieee;
use ieee.std_logic_1164.all;

entity Counter is
    port (
        S : in std_logic; 
        Y : out std_logic_vector(2 downto 0) 
    );
end entity Counter;

architecture Behavioral of Counter is
    type StateType is (S0, S1, S2, S3, S4);
    signal CurrentState, NextState : StateType := S0;

begin
    process (S, CurrentState)
    begin
        case CurrentState is
            when S0 =>
                if S = '0' then
                    NextState <= S1;
                    Y <= "001";
                else
                    NextState <= S4;
                    Y <= "100";
                end if;
                
            when S1 =>
                if S = '0' then
                    NextState <= S2;
                    Y <= "010";
                else
                    NextState <= S0;
                    Y <= "000";
                end if;
                
            when S2 =>
                if S = '0' then
                    NextState <= S3;
                    Y <= "011";
                else
                    NextState <= S1;
                    Y <= "001";
                end if;
                
            when S3 =>
                if S = '0' then
                    NextState <= S4;
                    Y <= "100";
                else
                    NextState <= S2;
                    Y <= "010";
                end if;
                
            when S4 =>
                if S = '0' then
                    NextState <= S0;
                    Y <= "000";
                else
                    NextState <= S3;
                    Y <= "011";
                end if;
                
            when others =>
                NextState <= S0;
                Y <= "000";
        end case;
    end process;

    process (NextState)
    begin
        CurrentState <= NextState;
    end process;
end architecture Behavioral;