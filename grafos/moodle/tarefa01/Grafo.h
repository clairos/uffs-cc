// Tarefa 01 - Grafo - Listas de Adjacencia
// GEN254 - Grafos - 2024/1
// Nome:      Ana Clara Brusamarello Barbosa
// Matricula: 2121101054

#ifndef GRAFO_H
#define GRAFO_H

#include "Aresta.h"
#include <vector>
#include <list>

class Grafo {
public:
    Grafo(int num_vertices);
    int num_vertices();
    int num_arestas();
    bool tem_aresta(Aresta e);
    bool tem_aresta(int v1, int v2);
    void insere_aresta(Aresta e);
    void remove_aresta(Aresta e);
    bool eh_clique(const std::vector<int>& conjunto_vertices);
    bool existe_caminho_restrito(int v1, int v2, int w, int z);
    void imprime_graus();

private:
    std::vector<std::list<int>> listas_adj_;
    int num_vertices_;
    int num_arestas_;
    bool existe_caminho_restrito_util(int v1, int v2, int w, int z, std::vector<bool>& visitado);
};

#endif /* GRAFO_H */
