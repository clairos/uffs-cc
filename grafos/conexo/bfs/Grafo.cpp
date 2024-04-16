#include "Grafo.h"
#include <queue>

// Construtor
Grafo::Grafo(int V) {
    this->V = V;
    adj.resize(V);
}

// Adiciona uma aresta ao grafo
void Grafo::adicionar_aresta(int v, int w) {
    adj[v].push_back(w); // Adiciona w à lista de adjacência de v
    adj[w].push_back(v); // Adiciona v à lista de adjacência de w
}

// Verifica se o grafo é conexo usando BFS
bool Grafo::eh_conexo() {
    std::vector<bool> visitado(V, false); // Inicializa todos os vértices como não visitados
    std::queue<int> fila; // Fila para BFS

    // Inicia BFS a partir do vértice 0
    visitado[0] = true;
    fila.push(0);

    while (!fila.empty()) {
        int v = fila.front();
        fila.pop();

        // Percorre todos os vértices adjacentes a v
        for (int i : adj[v]) {
            if (!visitado[i]) {
                visitado[i] = true;
                fila.push(i);
            }
        }
    }

    // Verifica se todos os vértices foram visitados
    for (int i = 0; i < V; ++i) {
        if (!visitado[i])
            return false; // Se algum vértice não foi visitado, o grafo não é conexo
    }
    return true; // Se todos os vértices foram visitados, o grafo é conexo
}