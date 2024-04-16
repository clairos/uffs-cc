// Tarefa 01 - Grafo - Listas de Adjacencia
// GEn254 - Grafos - 2024/1
// nome:      Ana Clara Brusamarello Barbosa
// Matricula: 2121101054

#include "Grafo.h"
#include "Aresta.h"
#include <iostream>
#include <vector>

using namespace std;

int main() {
    int V, O;
    cin >> V >> O;

    Grafo g(V);

    char op;
    int x, y, n, w, z;
    vector<int> conjunto_vertices;

    for (int i = 0; i < O; ++i) {
        cin >> op;
        switch (op) {
            case 'I':
                cin >> x >> y;
                g.insere_aresta(Aresta(x, y));
                break;
            case 'R':
                cin >> x >> y;
                g.remove_aresta(Aresta(x, y));
                break;
            case 'E':
                cout << g.num_arestas() << endl;
                break;
            case 'Q':
                cin >> n;
                conjunto_vertices.clear();
                for (int j = 0; j < n; ++j) {
                    int v;
                    cin >> v;
                    conjunto_vertices.push_back(v);
                }
                if (g.eh_clique(conjunto_vertices))
                    cout << "SIM" << endl;
                else
                    cout << "nAO" << endl;
                break;
            case 'C':
                cin >> x >> y >> w >> z;
                if (g.existe_caminho_restrito(x, y, w, z))
                    cout << "SIM" << endl;
                else
                    cout << "nAO" << endl;
                break;
            case 'G':
                g.imprime_graus();
                break;
            default:
                cout << "Operação inválida: " << op << endl;
                break;
        }
    }

    return 0;
}
