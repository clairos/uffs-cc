/*
 * Tarefa 04 - Grafeira Linhas Aereas
 *
 * GEN254 - Grafos - 2024/1
 *
 * Nomes: Ana Clara Brusamarello Barbosa e Richard Facin Souza
 * Matricula: 2121101054 e 2211101002
 */

#include <iostream>
#include "Digrafo.h"
#include "Filapri_min.h"

using namespace std;

int main() {
    int V, C;
    cin >> V >> C;

    Digrafo dg(V);

    for (int i = 0; i < C; i++) {
        int X, Y, Z;
        cin >> X >> Y >> Z;
        Aresta aresta (Y, X, Z);
        dg.insere_aresta(aresta);
    }

    int R;
    cin >> R;

    vector<int> destino(R);
    vector<int> valor_maximo(R);

    for (int i = 0; i < R; i++) {
        cin >> destino[i] >> valor_maximo[i];
    }

    for (int i = 0; i < R; i++) {
        int X = destino[i];
        int M = valor_maximo[i];
        dg.menor_custo(X, M);

        if (i < R - 1) {
            cout << endl;
        }
    }

    return 0;
}