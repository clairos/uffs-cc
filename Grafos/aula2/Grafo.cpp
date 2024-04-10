#include "Grafo.h"
#include <iostream>

using namespace std;

Grafo::Grafo(int num_vertices) {
    if (num_vertices <= 0) {
        throw invalid_argument("Número de vértices deve ser maior que zero.");
    }
    
    matriz_adj_.resize(num_vertices);
    
    for (int i = 0; i < num_vertices; i++){
        matriz_adj_[i].resize(num_vertices, 0);
    }

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
    if (matriz_adj_[e.v1][e.v2] > 0) {
        return true;
    } 
    return false;
}

void Grafo::insere_aresta(Aresta e) {
    if (!tem_aresta(e)) {
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

void Grafo::imprimir() {
    for (int i = 0; i < num_vertices_; i++) {
        cout << i << ":";
        for (int j = 0; j < num_vertices_; j++) {
            if (matriz_adj_[i][j] != 0) {
                cout << " " << j;
            }
        }
        cout << endl; // mesma coisa que \n
    }
}