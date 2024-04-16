# Trabalho final LP 

Interpretador de uma Tupla

## *Como rodar o projeto* 

- Primeiramente é necessário compilar o parser.y utilizando o happy:
    ```
     > happy Parser.y
    ```

- Para rodar o código utilizando os arquivos .mylang:
    ```
     > cat example.mylang | runghc Main.hs 
    ```

- Para rodar o código direto no terminal:
    ```
     > echo "if true then 2 else 5"  runghc Main 
    ```
