/*
 * Tarefa 04 - Grafeira Linhas Aereas
 *
 * GEN254 - Digrafos - 2024/1
 *
 * Nomes: Ana Clara Brusamarello Barbosa e Richard Facin Souza
 * Matricula: 2121101054 e 2211101002
 */

#include "Digrafo.h"
#include "Filapri_min.h"
#include <iostream>
#include <vector>
#include <utility>
#include <algorithm>
#include <limits.h>

using namespace std;

Digrafo::Digrafo(int num_vertices) {
    if (num_vertices <= 0) {
        throw invalid_argument("Número de vértices deve ser maior que zero.");
    }

    num_vertices_ = num_vertices;
    num_arestas_ = 0;
    lista_adj_.resize(num_vertices_);
}

int Digrafo::num_vertices() {
    return num_vertices_;
}

int Digrafo::num_arestas() {
    return num_arestas_;
}

bool Digrafo::tem_aresta(Aresta e) {
    int v1 = e.v1;
    int v2 = e.v2;
    for (const std::pair<int, int>& aresta : lista_adj_[v1]) {
        if (aresta.first == v2) {
            return true;
        }
    }
    return false;
}

void Digrafo::insere_aresta(Aresta e) {
    if (tem_aresta(e) || e.v1 == e.v2) return;

    if (e.v1 < 0 || e.v1 >= num_vertices_ || e.v2 < 0 || e.v2 >= num_vertices_) {
        throw out_of_range("Os vértices estão fora dos limites permitidos.");
    }

    if (e.peso < 0) {
        throw invalid_argument("O peso da aresta deve ser maior ou igual a zero.");
    }

    pair<int, int> destino = make_pair(e.v2, e.peso);
    lista_adj_[e.v1].push_back(destino);
    num_arestas_++;
}

void Digrafo::dijkstra(int s, vector<int> &pai, vector<int> &dp) {
    dp.resize(num_vertices_, INT_MAX);
    pai.resize(num_vertices_, -1);
    dp[s] = 0;

    Filapri_min<int> fila(num_vertices_);
    for (int i = 0; i < num_vertices_; i++) {
        fila.insere(i, dp[i]);
    }

    while (!fila.vazia()) {
        pair<int, int> u = fila.remove();
        if (dp[u.first] != INT_MAX) {
            for (const pair<int, int>& v : lista_adj_[u.first]) {
                if (dp[v.first] > dp[u.first] + v.second) {
                    dp[v.first] = dp[u.first] + v.second;
                    pai[v.first] = u.first;
                    fila.diminui_prio(v.first, dp[v.first]);
                }
            }
        }
    }
}

void Digrafo::menor_custo(int X, int M) {
    vector<int> pai, dp;
    dijkstra(X, pai, dp);

    for (int i = 0; i < num_vertices_; i++) {
        if (i != X) {
            if (dp[i] <= M) {
                cout << i << ": " << dp[i] << ", ";
                int j = i;
                vector<int> caminho;
                while (pai[j] != -1) {
                    caminho.push_back(j);
                    j = pai[j];
                }
                caminho.push_back(X);
                for (int v : caminho) {
                    cout << v << " ";
                }
                cout << endl;
            } else {
                cout << i << ": economicamente inviavel ate " << X << endl;
            }
        }
    }
}