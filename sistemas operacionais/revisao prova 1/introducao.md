# Introdução

---

#### 1. A ativação de uma rotina do núcleo usando esse mecanismo é requisição de interrupção (IRQ – Interrupt ReQuest) .

- [ ] V
- [x] F

#### 2. Sobre as afirmações a seguir, relativas às diversas arquiteturas de sistemas operacionais, indique quais são incorretas:

- [ ] Em um sistema operacional micronúcleo, os diversos componentes do sistema são construídos como módulos interconectados executando dentro do núcleo.
- [x] Maquina virtual é uma camada de software que 'transforma' um sistema em outro, ou seja, que usa os serviços fornecidos por um sistema operacional (ou pelo hardware) para construir a interface de outro sistema.
- [ ] Um hipervisor convidado executa sobre um sistema operacional hospedeiro.
- [ ] Em um sistema operacional micronúcleo, as chamadas de sistema são implementadas através de trocas de mensagens.
- [ ] Núcleos monolíticos são muito utilizados devido à sua robustez e facilidade de manutenção. (Linux, versões anteriores do Windows)

> uma máquina virtual não transforma um sistema em outro, mas sim fornece uma camada de abstração sobre o hardware real, permitindo que um sistema operacional (ou aplicação) execute como se estivesse em hardware dedicado. 

#### 3. Alguns dos componentes mais relevantes de um sistema operacional típico são: núcleo, código de inicialização, drivers e programas utilitários.

- [x] V
- [ ] F

#### 4. A operação em modo usuário permite ao processador executar somente parte das instruções disponíveis em seu conjunto de instruções. Quais das seguintes operações não deveriam ser permitidas em nível usuário?

- [x] Mascarar uma ou mais interrupções
- [x] Acessar portas de entrada/saída
- [x] Ler o valor dos registradores do processador
- [ ] Criar e gerenciar de threads dentro do mesmo processo
- [ ] Utilizar serviços via system calls

#### 5. Sobre as afirmações a seguir, relativas aos diversos tipos de sistemas operacionais, indique quais são incorretas, justificando sua resposta:

- [x] Nos sistemas operacionais de rede a localização dos recursos é transparente para os usuários
- [ ] Em um sistema operacional de tempo real, a rapidez de resposta é menos importante que a previsibilidade do tempo de resposta
- [ ] Um sistema operacional embarcado é projetado para operar em hardware com poucos recursos.
- [x] Um sistema operacional de tempo real deve priorizar as tarefas que interagem com o usuário.
- [ ] Um sistema operacional multi-usuários associa um proprietário a cada recurso do sistema e gerencia as permissões de acesso a esses recursos.

#### 6. Quais das alternativas a seguir são objetivos de um sistema operacional?
- [x] Abstração de recursos
- [x] Limitação da acessibilidade do hardware
- [x] Gerência de recursos
- [ ] Maximização da interferência entre processos e tarefas

#### 7. A camada mais baixa do sistema operacional, que constitui o chamado “núcleo” do sistema (ou kernel), somente pode executar um subconjunto das instruções do processador e tem acesso a alguns registradores. Por exemplo, instruções consideradas “perigosas”, como RESET (reiniciar o processador) e IN/OUT (acessar portas de entrada/saída), são proibidas.

- [x] V
- [ ] F

> O kernel opera em um nível privilegiado, mas com restrições intencionais para garantir a estabilidade e segurança do sistema.

#### 8. Os processadores da família x86 possuem dois bits para definir o nível de privilégio, resultando em de 4 níveis de privilégio (0 . . . 3, sendo 0 o nível mais privilegiado), embora a maioria dos sistemas operacionais construídos para esses processadores só use os níveis extremos (0 para o núcleo do sistema operacional e 3 para utilitários e aplicações)

- [x] V
- [ ] F

#### 9. A gerência de tarefas permite compartilhar o processador, executando mais de uma aplicação ao mesmo tempo. Identifique as principais vantagens trazidas por essa funcionalidade: Distribuição justa dos recursos provê a ilusão de que existe um processador independente para cada tarefa, o que facilita o trabalho dos programadores de aplicações e permite a construção de sistemas mais interativos.

- [x] V
- [ ] F

#### 10. A gerência de tarefas permite compartilhar o processador:

- [ ] apenas entre programas do sistema operacional.
- [ ] de forma exclusiva para uma única tarefa por vez.
- [ ] com dispositivos externos diretamente, sem intermediação do SO
- [ ] sem qualquer controle de prioridades ou de tempo de uso.
- [x] executando mais de uma aplicação ao mesmo tempo

#### 11. Assinale as alternativas corretas:

- [x] O MacOS X é um exemplo típico de sistema operacional de desktop.
- [x] Os sistemas operacionais embarcados são usado por empresas para executar seu banco de dados corporativo.
- [x] A gerência de energia é muito importante nos ssitemas embarcados.
- [x] Nos sistemas operacionais distribuídos a localização física dos recursos do sistema computacional é transparente para os usuários.
- [ ] Os sistemas operacionais de servidor são compactos, construídos para executar aplicações específicas sobre plataformas com poucos recursos

#### 12. São exemplos de aplicações que executam no nível de núcleo, também denominado nível supervisor, sistema, monitor ou ainda kernel space: editor de texto, navegador e cliente de e-mail.

- [ ] V
- [x] F

> O núcleo é responsável pelas funções básicas do sistema, como gerenciamento de memória, processamento e acesso a dispositivos de hardware. O espaço do usuário, por outro lado, é onde os programas de aplicativos, como editores de texto, navegadores e clientes de e-mail, são executados.

#### 13. Quais as diferenças entre interrupções, exceções e traps?

Enquanto as interrupções são eventos externos que exigem a atenção imediata do sistema, as exceções são eventos internos que ocorrem durante a execução do programa e as traps são mecanismos controlados pelo próprio programa para gerar exceções ou interrupções em pontos específicos.