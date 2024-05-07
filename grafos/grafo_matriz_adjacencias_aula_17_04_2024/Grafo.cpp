#include "Grafo.h"
#include <iostream>

using namespace std;

Grafo::Grafo(int num_vertices) {
    if (num_vertices <= 0) {
        throw(invalid_argument("Erro no construtor Grafo(int): o numero de "
            "vertices " + to_string(num_vertices) + " eh invalido!"));
    }

    matriz_adj_.resize(num_vertices);
    for (int i = 0; i < num_vertices; i++) {
        matriz_adj_[i].resize(num_vertices, 0);
    }

    // Para representar o grafo como listas de adjacencia
    // listas_adj_.resize(num_vertices);
    //
    // Os outros metodos desta classe precisam ser adaptados

    num_vertices_ = num_vertices;
    num_arestas_ = 0;
}

int Grafo::num_vertices() {
    return num_vertices_;
}

int Grafo::num_arestas() {
    return num_arestas_;
}

bool Grafo::tem_aresta(Aresta e) {
    if (matriz_adj_[e.v1][e.v2] != 0) {
        return true;
    }
    return false;
}

void Grafo::insere_aresta(Aresta e) {
    if (!tem_aresta(e) && (e.v1 != e.v2)) {
        matriz_adj_[e.v1][e.v2] = 1;
        matriz_adj_[e.v2][e.v1] = 1;

        num_arestas_++;
    }
}

void Grafo::remove_aresta(Aresta e) {
    if (tem_aresta(e)) {
        matriz_adj_[e.v1][e.v2] = 0;
        matriz_adj_[e.v2][e.v1] = 0;

        num_arestas_--;
    }
}

void Grafo::busca_prof(int v, vector<int> &marcado) {
    // printf("%d\n", v); // Nao vamos imprimir os vertices visitados
    marcado[v] = 1;
    for (int u = 0; u < num_vertices_; u++) {
        if (matriz_adj_[v][u] != 0) {
            if (marcado[u] == 0) {
                busca_prof(u, marcado);
            }
        }
    }
}

bool Grafo::eh_conexo() {
    vector<int> marcado(num_vertices_);

    busca_prof(0, marcado);

    for (int v = 0; v < num_vertices_; v++) {
        if (marcado[v] == 0) {
            return false;
        }
    }
    return true;
}

void Grafo::imprime() {
    for (int i = 0; i < num_vertices_; i++) {
        cout << i << ":";
        for (int j = 0; j < num_vertices_; j++) {
            if (matriz_adj_[i][j] != 0) {
                cout << " " << j;
            }
        }
        cout << "\n";
    }
}
