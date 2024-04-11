// exemplo algoritmo para ver se um grafo é conexo

bool eh_conexo() {
    vector<int> marcado (num_vertices_);
    for (int i=0; i < num_vertices_; i++) {
        for (int j=(i+1); j < num_vertices_; j++) {
            if (!caminho(i, j, marcado)) {
                return false;
            }

            return true;
        }
    }
}
