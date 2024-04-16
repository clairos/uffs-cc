library ieee;
use ieee.std_logic_1164.all;

entity smarthome is
  port (
    estado_janela : in std_logic_vector(2 downto 0);
    estado_porta : in std_logic_vector(1 downto 0);
    modo_seguro : in std_logic;
    sensor_luminosidade : in std_logic;
    sensor_clima : in std_logic;
    sensor_temperatura_1 : in std_logic_vector(7 downto 0);
    sensor_temperatura_2 : in std_logic_vector(7 downto 0);
    nivel_reservatorio : in std_logic_vector(3 downto 0);
    max_reservatorio : in std_logic;

    alerta_seguranca : out std_logic;
    aviso_janela_aberta : out std_logic_vector(2 downto 0);
    modo_seguranca_janela_aberta : out std_logic;
    alerta_janela_aberta_noite : out std_logic;
    alerta_porta_janela_aberta_chuva : out std_logic;
    bomba_agua : out std_logic;
    valvula : out std_logic
  );
end smarthome;

architecture arch_smarthome of smarthome is

  component seguranca is
    port (
      estado_janela : in std_logic_vector(2 downto 0);
      estado_porta : in std_logic_vector(1 downto 0);
      modo_seguro : in std_logic;
      alerta_seguranca : out std_logic;
      aviso_janela_aberta : out std_logic_vector(2 downto 0);
      modo_seguranca_janela_aberta : out std_logic
    );
  end component seguranca;

  component sistema_amanhecer is
    port (
      estado_janela : in std_logic_vector(2 downto 0);
      sensor_luminosidade : in std_logic;
      alerta_janela_aberta_noite : out std_logic
    );
  end component sistema_amanhecer;

  component sistema_clima is
    port (
      sensor_clima : in std_logic;
      estado_janela : in std_logic_vector(2 downto 0);
      estado_porta : in std_logic_vector(1 downto 0);
      alerta_porta_janela_aberta_chuva : out std_logic
    );
  end component sistema_clima;

  component sistema_agua is
    port (
      nivel_reservatorio : in std_logic_vector(3 downto 0);
      max_reservatorio : in std_logic;
      bomba_agua : out std_logic;
      valvula : out std_logic
    );
  end component sistema_agua;

begin

  seguranca_comp : seguranca
  port map(
    estado_janela(0) => estado_janela(0),
    estado_janela(1) => estado_janela(1),
    estado_janela(2) => estado_janela(2),
    estado_porta(0) => estado_porta(0),
    estado_porta(1) => estado_porta(1),
    modo_seguro => modo_seguro,
    alerta_seguranca => alerta_seguranca,
    aviso_janela_aberta(0) => aviso_janela_aberta(0),
    aviso_janela_aberta(1) => aviso_janela_aberta(1),
    aviso_janela_aberta(2) => aviso_janela_aberta(2),
    modo_seguranca_janela_aberta => modo_seguranca_janela_aberta
  );

  crepuscular_comp : sistema_amanhecer
  port map(
    estado_janela(0) => estado_janela(0),
    estado_janela(1) => estado_janela(1),
    estado_janela(2) => estado_janela(2),
    sensor_luminosidade => sensor_luminosidade,
    alerta_janela_aberta_noite => alerta_janela_aberta_noite
  );

  clima_comp : sistema_clima
  port map(
    sensor_clima => sensor_clima,
    estado_janela(0) => estado_janela(0),
    estado_janela(1) => estado_janela(1),
    estado_janela(2) => estado_janela(2),
    estado_porta(0) => estado_porta(0),
    estado_porta(1) => estado_porta(1),
    alerta_porta_janela_aberta_chuva => alerta_porta_janela_aberta_chuva
  );

  agua_comp : sistema_agua
  port map(
    nivel_reservatorio(0) => nivel_reservatorio(0),
    nivel_reservatorio(1) => nivel_reservatorio(1),
    nivel_reservatorio(2) => nivel_reservatorio(2),
    nivel_reservatorio(3) => nivel_reservatorio(3),
    max_reservatorio => max_reservatorio,
    bomba_agua => bomba_agua,
    valvula => valvula
  );

end arch_smarthome; 

library ieee;
use ieee.std_logic_1164.all;

entity seguranca is
  port (
    estado_janela : in std_logic_vector(2 downto 0);
    estado_porta : in std_logic_vector(1 downto 0);
    modo_seguro : in std_logic;
    alerta_seguranca : out std_logic;
    aviso_janela_aberta : out std_logic_vector(2 downto 0);
    modo_seguranca_janela_aberta : out std_logic
  );
end seguranca;

architecture arch_seguranca of seguranca is

begin

  process (modo_seguro, estado_janela, estado_porta)
    variable ativar_alerta_seguranca : std_logic;
  begin
    ativar_alerta_seguranca := '0';
    if (modo_seguro = '1') then
      if (estado_janela(0) = '1') or (estado_janela(1) = '1') or (estado_janela(2) = '1') then
        ativar_alerta_seguranca := '1';
      end if;
    end if;

    if (estado_porta(0) = '1') and (not(estado_porta(1)) = '0') then
      ativar_alerta_seguranca := '1';
    end if;

    if (modo_seguro = '1') and (not(estado_porta(1)) = '0') and ((estado_janela(0) = '1') or (estado_janela(1) = '1') or (estado_janela(2) = '1')) then
      modo_seguranca_janela_aberta <= '1';
    else
      modo_seguranca_janela_aberta <= '0';
    end if;

    alerta_seguranca <= ativar_alerta_seguranca;

    if (estado_janela(0) = '1') then
      aviso_janela_aberta(0) <= '1';
    else
      aviso_janela_aberta(0) <= '0';
    end if;

    if (estado_janela(1) = '1') then
      aviso_janela_aberta(1) <= '1';
    else
      aviso_janela_aberta(1) <= '0';
    end if;

    if (estado_janela(2) = '1') then
      aviso_janela_aberta(2) <= '1';
    else
      aviso_janela_aberta(2) <= '0';
    end if;
  end process;

end arch_seguranca; 

library ieee;
use ieee.std_logic_1164.all;

entity sistema_amanhecer is
  port (
    estado_janela : in std_logic_vector(2 downto 0);
    sensor_luminosidade : in std_logic;
    alerta_janela_aberta_noite : out std_logic
  );
end sistema_amanhecer;

architecture arch_sistema_amanhecer of sistema_amanhecer is

begin

  process (sensor_luminosidade, estado_janela)
    variable alerta : std_logic := '0';
  begin
    alerta := '0';
    for janela in 0 to 2 loop
      if (sensor_luminosidade = '1') and (estado_janela(janela) = '1') then
        alerta := '1';
      end if;
    end loop;
    if (alerta = '1') then
      alerta_janela_aberta_noite <= '1';
    else
      alerta_janela_aberta_noite <= '0';
    end if;
  end process;

end arch_sistema_amanhecer; 

library ieee;
use ieee.std_logic_1164.all;

entity sistema_clima is
  port (
    sensor_clima : in std_logic;
    estado_janela : in std_logic_vector(2 downto 0);
    estado_porta : in std_logic_vector(1 downto 0);
    alerta_porta_janela_aberta_chuva : out std_logic
  );
end sistema_clima;

architecture arch_sistema_clima of sistema_clima is

begin

  process (sensor_clima, estado_janela, estado_porta)
    variable alerta : std_logic := '0';
  begin
    alerta := '0';
    if (sensor_clima = '1') and ((estado_janela(0) = '1') or (estado_janela(1) = '1')) then
      alerta := '1';
    end if;
    if (sensor_clima = '1') and ((estado_porta(0) = '1') or (estado_porta(1) = '1')) then
      alerta := '1';
    end if;
    if (alerta = '1') then
      alerta_porta_janela_aberta_chuva <= '1';
    else
      alerta_porta_janela_aberta_chuva <= '0';
    end if;
  end process;

end arch_sistema_clima; 

library ieee;
use ieee.std_logic_1164.all;

entity sistema_agua is
  port (
    nivel_reservatorio : in std_logic_vector(3 downto 0);
    max_reservatorio : in std_logic;
    bomba_agua : out std_logic;
    valvula : out std_logic
  );
end sistema_agua;

architecture arch_sistema_agua of sistema_agua is

begin

  process (nivel_reservatorio, max_reservatorio)
  begin
    if (nivel_reservatorio = "1111") or (max_reservatorio = '1') then
      bomba_agua <= '0';
    else
      bomba_agua <= '1';
    end if;

    if (nivel_reservatorio = "1111") then
      valvula <= '0';
    else
      valvula <= '1';
    end if;
  end process;

end arch_sistema_agua; 