#ifndef GRAFO_H
#define GRAFO_H

#include <vector>

class Grafo {
    int V; // Número de vértices
    std::vector<std::vector<int>> adj; // Lista de adjacência

public:
    Grafo(int V); // Construtor
    void adicionar_aresta(int v, int w); // Adiciona uma aresta ao grafo
    bool eh_conexo(); // Verifica se o grafo é conexo
};

#endif