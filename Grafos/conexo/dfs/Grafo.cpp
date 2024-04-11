#include "Grafo.h"

// Construtor
Grafo::Grafo(int V) {
    this->V = V;
    adj.resize(V);
}

// Função para adicionar uma aresta ao grafo
void Grafo::adicionar_aresta(int v, int w) {
    adj[v].push_back(w); // Adiciona w à lista de adjacência de v
    adj[w].push_back(v); // Adiciona v à lista de adjacência de w
}

// Função de busca em profundidade recursiva
void Grafo::busca_profundidade(int v, std::vector<bool>& visitado) {
    // Marca o vértice atual como visitado
    visitado[v] = true;

    // Percorre todos os vértices adjacentes a este vértice
    for (int i : adj[v]) {
        if (!visitado[i])
            busca_profundidade(i, visitado);
    }
}

// Função para verificar se o grafo é conexo
bool Grafo::eh_conexo() {
    // Inicializa todos os vértices como não visitados
    std::vector<bool> visitado(V, false);

    // Realiza a busca em profundidade a partir de um vértice arbitrário
    busca_profundidade(0, visitado);

    // Verifica se todos os vértices foram visitados
    for (int i = 0; i < V; ++i) {
        if (!visitado[i])
            return false; // Se algum vértice não foi visitado, o grafo não é conexo
    }
    return true; // Se todos os vértices foram visitados, o grafo é conexo
}
