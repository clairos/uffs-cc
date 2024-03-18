# INTRODUÇÃO DO PROJETO

Construção de aplicação para gerar Autômato Finito Determinístico.

## Objetivo

Construção de uma aplicação capaz de gerar um AFD livre de estados inalcançáveis e mortos.
Entrada: arquivo com a relação de tokens e/ou GRs de uma linguagem.
Saída: Autômato Finito Determinístico (AFD) e mínimo sem a aplicação de classes de equivalência 
entre estados. 

## Descrição

A aplicação realiza a carga de tokens (palavras reservadas, operadores, símbolos especiais, ...) e 
Gramáticas Regulares (GR) a partir de um arquivo fonte (texto), gerando o AFND. 
Por exemplo, se o arquivo de entrada tem as seguintes informações

Exemplo de arquivo de entrada:

            se
            entao
            senao
            <S> ::= a<A> | e<A> | i<A> | o<A> | u<A>
            <A> ::= a<A> | e<A> | i<A> | o<A> | u<A> | ε



Para cada token e gramática, a aplicação gera o conjunto de transições rotuladas em um único AF 
durante o procedimento de carga. No AF, apenas o estado inicial é compartilhado entre diferentes 
tokens/gramáticas. Os demais estados são exclusivos para as transições dos demais símbolos dos 
tokens e/ou estados das GRs. Ou seja, após o estado final, na carga, todas as demais transições têm um 
novo estado como destino. 
O AF será indeterminístico quando ocorrer uma ou mais situações em que dois tokens ou sentenças 
definidas por GR iniciam pelo mesmo símbolo.
