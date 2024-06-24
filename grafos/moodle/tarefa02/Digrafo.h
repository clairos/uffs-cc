/*
 * Tarefa 04 - Grafeira Linhas Aereas
 *
 * GEN254 - Grafos - 2024/1
 *
 * Nomes: Ana Clara Brusamarello Barbosa e Richard Facin Souza
 * Matricula: 2121101054 e 2211101002
 */

#ifndef DIGRAFO_H

#define DIGRAFO_H

#include "Aresta.h"
#include "Filapri_min.h"
#include <vector>
#include <stdexcept>
#include <iostream>

class Digrafo {
public:
    Digrafo(int num_vertices);

    int num_vertices();
    int num_arestas();
    bool tem_aresta(Aresta e);
    void insere_aresta(Aresta e);
    Digrafo inverte_arestas();
    void dijkstra(int s, std::vector<int> &pai, std::vector<int> &dp);
    void menor_custo(int X, int M);

private:
    int num_vertices_;
    int num_arestas_;

    std::vector<std::vector<std::pair<int, int>>> lista_adj_;
};

#endif /* DIGRAFO_H */