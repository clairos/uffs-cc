/*
 * Tarefa 04 - Grafeira Linhas Aereas
 *
 * GEN254 - Grafos - 2024/1
 *
 * Nomes: Ana Clara Brusamarello Barbosa e Richard Facin Souza
 * Matricula: 2121101054 e 2211101002
 */

#ifndef FILAPRI_MIN_H

#define FILAPRI_MIN_H

#include <vector>
#include <utility>

template <typename T>
class Filapri_min {
public:
    Filapri_min(int max_num_itens);
    
    bool vazia();
    bool cheia();
    
    bool tem_indice(int ind);
    
    void insere(int ind, T prio);
    std::pair<int, T> remove();
    
    T prio(int ind);
    void diminui_prio(int ind, T prio);
private:
    int max_num_itens_;
    int num_itens_;
    std::vector<std::pair<int, T>> itens_;
    std::vector<int> ind_posfila_;

    int pai(int i);
    int filho_esq(int i);
    int filho_dir(int i);

    void troca(int i, int j);
    void conserta_para_cima(int i);
    void conserta_para_baixo(int i);

    void valida_indice(int ind);
};

#endif /* FILAPRI_MIN_H */
