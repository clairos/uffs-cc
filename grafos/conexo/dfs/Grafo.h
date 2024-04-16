#ifndef GRAFO_H
#define GRAFO_H

#include <vector>

class Grafo {
    int V; // Número de vértices
    std::vector<std::vector<int>> adj; // Ponteiro para um array contendo as listas de adjacência

    // Função de busca em profundidade recursiva
    void busca_profundidade(int v, std::vector<bool>& visitado);

public:
    Grafo(int V); // Construtor

    // Função para adicionar uma aresta ao grafo
    void adicionar_aresta(int v, int w);

    // Função para verificar se o grafo é conexo
    bool eh_conexo();
};

#endif
