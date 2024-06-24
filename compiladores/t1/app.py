from lfa import *

afd = {}
alfabeto = []
gramatica = []

entrada = open("entrada.txt", "r") 
entradaString = entrada.read() 
entradaLista = entradaString.split('\n')

listaAuxiliar = entradaLista.copy()

for tokenLido in listaAuxiliar:
    if not tokenLido:
        entradaLista.remove(tokenLido) 
        break 
    gerarAfndToken(afd, tokenLido, alfabeto) 
    entradaLista.remove(tokenLido) 

listaAuxiliar = entradaLista.copy()

while entradaLista:
    for regraGramaticaLida in listaAuxiliar:    
        if not regraGramaticaLida:
            gerarAfndGramatica(afd, gramatica, alfabeto) 
            gramatica.clear() 
            entradaLista.remove(regraGramaticaLida)
        else:
            gramatica.append(regraGramaticaLida) 
            entradaLista.remove(regraGramaticaLida)

eliminarEpsilonTransicoes(afd)
determinizar(afd)
eliminarInalcancaveis(afd)
eliminarInuteis(afd)
exibirAutomatoDeterministico(afd, alfabeto)
fazerAnaliseLexica(afd)