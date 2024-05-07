#include "Grafo.h"
#include "Aresta.h"
#include <iostream>

using namespace std;

int main() {
    try {
        Grafo grafo_1(4);
        grafo_1.imprime();
        cout << grafo_1.num_arestas() << "\n";

        Aresta e(0, 1);
        grafo_1.insere_aresta(e);

        grafo_1.insere_aresta(Aresta(0, 2));
        grafo_1.insere_aresta(Aresta(0, 2));

        cout << "\n";
        grafo_1.imprime();
        cout << grafo_1.num_arestas() << "\n";

        grafo_1.remove_aresta(Aresta(0, 1));

        cout << "\n";
        grafo_1.imprime();
        cout << grafo_1.num_arestas() << "\n";

        Grafo grafo_2(5);

        grafo_2.insere_aresta(Aresta(0, 1));
        grafo_2.insere_aresta(Aresta(0, 2));
        grafo_2.insere_aresta(Aresta(3, 4));
        // grafo_2 nao eh um grafo conexo

        cout << "\n";
        grafo_2.imprime();
        cout << "Conexo: ";
        if (grafo_2.eh_conexo()) {
            cout << "Sim";
        }
        else {
            cout << "Nao";
        }
        cout << "\n";

        grafo_2.insere_aresta(Aresta(2, 3));
        // Apos a aresta acima ser inserida, grafo_2 eh um grafo conexo

        cout << "\n";
        grafo_2.imprime();
        cout << "Conexo: ";
        if (grafo_2.eh_conexo()) {
            cout << "Sim";
        }
        else {
            cout << "Nao";
        }
        cout << "\n";
    }
    catch (const exception &e) {
        cerr << "exception: " << e.what() << "\n";
    }

    return 0;
}
