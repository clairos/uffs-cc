// Tarefa 01 - Grafo - Listas de Adjacencia
// GEN254 - Grafos - 2024/1
// Nome:      Ana Clara Brusamarello Barbosa
// Matricula: 2121101054

#include "Grafo.h"
#include <iostream>

using namespace std;

Grafo::Grafo(int num_vertices) {
    if (num_vertices <= 0) {
        throw invalid_argument("Número de vértices deve ser maior que zero.");
    }
    
    listas_adj_.resize(num_vertices);
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
    return tem_aresta(e.v1, e.v2);
}

bool Grafo::tem_aresta(int v1, int v2) {
    for (int vertice : listas_adj_[v1]) {
        if (vertice == v2) {
            return true;
        }
    }
    return false;
}

void Grafo::insere_aresta(Aresta e) {
    if (!tem_aresta(e.v1, e.v2) && e.v1 != e.v2) {
        listas_adj_[e.v1].push_back(e.v2);
        listas_adj_[e.v2].push_back(e.v1);
        num_arestas_++;
    }
}

void Grafo::remove_aresta(Aresta e) {
    if (tem_aresta(e.v1, e.v2)) {
        listas_adj_[e.v1].remove(e.v2);
        listas_adj_[e.v2].remove(e.v1);
        num_arestas_--;
    }
}

bool Grafo::eh_clique(const vector<int>& conjunto_vertices) {
    for (size_t i = 0; i < conjunto_vertices.size(); ++i) {
        for (size_t j = i + 1; j < conjunto_vertices.size(); ++j) {
            if (!tem_aresta(conjunto_vertices[i], conjunto_vertices[j]))
                return false;
        }
    }
    return true;
}

bool Grafo::existe_caminho_restrito(int v1, int v2, int w, int z) {
    vector<bool> visitado(num_vertices_, false);
    visitado[v1] = true;
    return existe_caminho_restrito_util(v1, v2, w, z, visitado);
}

bool Grafo::existe_caminho_restrito_util(int v1, int v2, int w, int z, vector<bool>& visitado) {
    if (v1 == v2)
        return true;

    for (int vertice : listas_adj_[v1]) {
        if (!visitado[vertice] && !(v1 == w && vertice == z) && !(v1 == z && vertice == w)) {
            visitado[vertice] = true;
            if (existe_caminho_restrito_util(vertice, v2, w, z, visitado))
                return true;
            visitado[vertice] = false;
        }
    }

    return false;
}

void Grafo::imprime_graus() {
    for (int i = 0; i < num_vertices_; i++) {
        cout << i << ": " << listas_adj_[i].size() << endl;
    }
}
