#include <iostream>
#include "Grafo.h"

int main() {
    // Cria um grafo com 5 vértices
    Grafo g(5);

    // Adiciona arestas ao grafo para torná-lo conexo
    g.adicionar_aresta(0, 1);
    g.adicionar_aresta(0, 2);
    g.adicionar_aresta(1, 2);
    g.adicionar_aresta(2, 3);
    g.adicionar_aresta(3, 4);
    g.adicionar_aresta(4, 0);

    // Verifica se o grafo é conexo
    if (g.eh_conexo())
        std::cout << "O grafo é conexo." << std::endl;
    else
        std::cout << "O grafo não é conexo." << std::endl;

    return 0;
}
