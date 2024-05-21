# Escalonamento 

1. Quando o escalonador tem que trabalhar?
    - Quando há um item compartilhado entre ela

---

### Transações
Conjunto de passos executados pelo SGDB que realiza uma tarefa do usuário

Propriedades:
- Atômicas
- Consistentes
- Isoladas
- Duradouras

&rarr; Uma transação termina com um *commit* (sucesso) ou um *rollback* (fracasso)

### Controle de concorrência 

Duas técnicas para garantir a concorrência
1. Bloqueios
2. Timestamps

---
## Escalonamento

Intuitivamente, um conflito entre Ij e Ji provoca uma ordem temporal entre elas.

Duas operações em um escalonamento são consideradas entrando em conflito se:

- Pertencem a diferentes transações
- Acessam o mesmo item Q
- Pelo menos uma das operações é um Write
- Assim temos os acrônimos:
    - RW (pode causar leitura não repetível)
    - WR (pode causar leitura suja)
    - WW (pode causar atualização perdida)

O escalonador deve cooperar com o recuperador
- Categorias:
    1. Recuperáveis x não recuperáveis
    2. Permite aborto em cascata x evitam aborto em cascata
    3. Estritos x não estritos

### Não Recuperável

Um escalonamento S pode ser não recuperável se uma transação T' lê um item de outra transação T, e T' *commita* antes de T
- Uma transação T' lê um item gravado por T, T' confirma e em seguida T aborta

### Recuperável

Um escalonamento S é recuperável se nenhuma transação T' em S é confirmada até que todas as transações T que gravaram algum item que T' lê sejam confirmadas

&rarr; Pode gerar aborto em cascata
> Aborto em cascata é custoso para o banco

- Como evitar aborto em cascata?
    - Uma T em S só pode ler dados que tenham sido atualizados por outras transações que já concluíram

### Estrito

Um escalonamento é dito estrito se uma transação T não puder ler nem escrever um item X até que a última transação T' que escreveu X tenha sido validada ou abortada

> Todo escalonamento estrito é recuperável e evita aborto em cascata

---

## Teoria da serializibilidade (equivalência de *schedules*)

**&rarr; Quando um escalonamento não-serial é válido?**
Um escalonamento não serial é válido se for serializável, ou seja, se for equivalente a um escalonamento serial, garantindo a integridade e consistência dos dados.

Garantia de escalonamentos não-seriais válidos

- Escalonamento serializável equivalente no resultado
    - visto apenas para conhecimento

- Escalonamento serializável equivalente em conflito
    - A ordem de duas operações em conflito quaisquer for a mesma nos dois escalonamentos
    - Transformando um *schedule* serial S em um não serial S' com S' respeitando as operações em conflitos, S' é dito serializável equivalente em conflito

