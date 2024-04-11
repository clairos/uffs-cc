void Grafo::busca_larg(int v) {
    // criacao e inicializacao do vetor marcado
    queue<int> fila;
    marcado[v] = 1;
    fila.push(v);

    while (!fila.empty()) {
        int w = fila.front();
        fila.pop();
        printf("%d\n", w);
        
        for (int u = 0; u < num_vertices_; u++) {
            if (matriz_adj_[w][u] != 0) {
                if (marcado[u] == 0) {
                    marcado[u] = 1; // marca antes de inserir na fila
                    fila.push(u);
                }
            }
        }
    }
}