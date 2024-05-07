#ifndef GRAFO_H

#define GRAFO_H

#include "Aresta.h"
#include <vector>
// Para representar o grafo como listas de adjacencia
// #include <list>

class Grafo {
public:
    /** Constroi um grafo simples que possui o numero de vertices recebido por
     *  parametro e que nao possui arestas */
    Grafo(int num_vertices);
    
    int num_vertices();
    int num_arestas();

    bool tem_aresta(Aresta e);

    /** Insere uma aresta no grafo caso a aresta ainda nao exista no grafo e
     * nao seja um laco */
    void insere_aresta(Aresta e);

    /** Remove uma aresta do grafo caso a aresta exista no grafo */
    void remove_aresta(Aresta e);

    void busca_prof(int v, std::vector<int> &marcado);
    bool eh_conexo();

    void imprime();
private:
    std::vector<std::vector<int>> matriz_adj_;
    // Para representar o grafo como listas de adjacencia
    // std::vector<std::list<int>> listas_adj_;

    int num_vertices_;
    int num_arestas_;
};

#endif /* GRAFO_H */
