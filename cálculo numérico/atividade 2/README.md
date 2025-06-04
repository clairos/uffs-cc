# Tarefa sobre interpolação polinomial

**Descrição:** Programar as formas de *Lagrange* e de *Gregory-Newton* para interpolação polinomial. Colocar um contador de operações e analisar qual método usou o menor número de operações e o menor tempo de execução.

## Como funciona

Ao rodar o arquivo `lag_gregnew.py`, será pedido ao usuário a quantidade de pontos, os valores dos pontos em pares `(x, y)` e o valor de `z` para o ponto de interpolação.

O programa irá calcular os dois métodos de interpolação para os dados inseridos.

Logo sem seguida, será exibido os resultados de ambos os métodos na tela, e os resultados de eficiência baseados tanto em quantidade de operações, quanto em tempo de execução.

> **Observação:** Foi adicionado uma validação de erro para o método Gregory-Newton, que irá executar o método apenas se o intervalo entre os pontos de `x` forem uniformes.

## Como compilar

Rodar o arquivo com o seguinte comando:

```
python lag_gregnew.py
```

> É necessário ter instalado a versão 3.8 ou mais recente do Python
