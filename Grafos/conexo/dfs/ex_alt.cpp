// busca em profundidade - implementação alternativa

void Grafo::busca_prof(int v) {
    // criacao e inicializacao do vetor marcado
    stack<int> pilha;
    pilha.push(v);

    while (!pilha.empty()) {
        int w = pilha.top();
        pilha.pop();
        if (marcado[w] == 0) {
            printf("%d\n", w);
            marcado[w] = 1;

            for (int u = (num_vertices_ - 1); u >= 0; u--) {
                if (matriz_adj_[w][u] != 0) {
                    if (marcado[u] == 0) {
                        pilha.push(u);
                    }
                }
            }
        }
    }
}