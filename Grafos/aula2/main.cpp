#include "Grafo.h"
#include "Aresta.h"
#include <iostream>

using namespace std;

int main() {
    try {
        Grafo g(4);
        // g.imprimir();
        cout << "arestas: " << g.num_arestas() << "\n";
        cout << "\n";

        Aresta e(0, 1);
        g.insere_aresta(e);
        g.insere_aresta(Aresta(0,2));

        g.imprimir();
        cout << "arestas: " << g.num_arestas() << "\n";
        cout << "\n";

        g.remove_aresta(Aresta(0,1));
        g.imprimir();
        cout << "arestas: " << g.num_arestas() << endl;
    }
    catch (const exception &e) {
        cerr << "exception: " << e.what() << "\n";
    }

    return 0;
}
