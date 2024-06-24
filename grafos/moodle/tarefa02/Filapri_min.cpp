/*
 * Tarefa 04 - Grafeira Linhas Aereas
 *
 * GEN254 - Grafos - 2024/1
 *
 * Nomes: Ana Clara Brusamarello Barbosa e Richard Facin Souza
 * Matricula: 2121101054 e 2211101002
 */

#include "Filapri_min.h"
#include <exception>
#include <stdexcept>
#include <algorithm>

using namespace std;

template <typename T>
Filapri_min<T>::Filapri_min(int max_num_itens) {
    if (max_num_itens <= 0) {
        throw(invalid_argument("Erro no construtor Filapri_min(int): o numero"
            " maximo de itens " + to_string(max_num_itens) + " eh invalido!")
            );
    }

    max_num_itens_ = max_num_itens;
    num_itens_ = 0;

    itens_.resize(max_num_itens);
    ind_posfila_.resize(max_num_itens, -1);
}

template <typename T>
bool Filapri_min<T>::vazia() {
    return (num_itens_ == 0);
}

template <typename T>
bool Filapri_min<T>::cheia() {
    return (num_itens_ == max_num_itens_);
}

template <typename T>
bool Filapri_min<T>::tem_indice(int ind) {
    try {
        valida_indice(ind);
    } catch (...) {
        throw_with_nested(runtime_error("Erro na operacao tem_indice(int): o "
            "indice " + to_string(ind) + " eh invalido!"));
    }

    return (ind_posfila_[ind] != -1);
}

template <typename T>
void Filapri_min<T>::insere(int ind, T prio) {
    if (cheia()) {
        throw(runtime_error("Erro na operacao insere: fila de prioridade "
            "cheia!"));
    }

    try {
        valida_indice(ind);
    } catch (...) {
        throw_with_nested(runtime_error("Erro na operacao insere: o "
            "indice " + to_string(ind) + " do item eh invalido!"));
    }

    if (tem_indice(ind)) {
        throw(runtime_error("Erro na operacao insere: o indice " +
            to_string(ind) + " do item ja existe na fila de prioridade!"));
    }

    itens_[num_itens_] = {ind, prio};
    ind_posfila_[ind] = num_itens_;
    num_itens_++;

    conserta_para_cima(num_itens_ - 1);
}

template <typename T>
pair<int, T> Filapri_min<T>::remove() {
    if (vazia()) {
        throw(runtime_error("Erro na operacao remove(): fila de prioridade "
            "vazia!"));
    }

    pair<int, T> item = itens_[0];

    ind_posfila_[itens_[0].first] = -1;

    itens_[0] = itens_[num_itens_ - 1];
    ind_posfila_[itens_[0].first] = 0;

    num_itens_--;

    conserta_para_baixo(0);

    return item;
}

template <typename T>
T Filapri_min<T>::prio(int ind) {
    try {
        valida_indice(ind);
    } catch (...) {
        throw_with_nested(runtime_error("Erro na operacao prio(int): o "
            "indice " + to_string(ind) + " eh invalido!"));
    }

    if (!tem_indice(ind)) {
        throw(runtime_error("Erro na operacao prio(int): o indice " +
            to_string(ind) + " nao existe na fila de prioridade!"));
    }

    return itens_[ind_posfila_[ind]].second;
}

template <typename T>
void Filapri_min<T>::diminui_prio(int ind, T prio) {
    try {
        valida_indice(ind);
    } catch (...) {
        throw_with_nested(runtime_error("Erro na operacao diminui_prio: o "
            "indice " + to_string(ind) + " eh invalido!"));
    }

    if (!tem_indice(ind)) {
        throw(runtime_error("Erro na operacao diminui_prio: o indice " +
            to_string(ind) + " nao existe na fila de prioridade!"));
    }

    if (prio >= itens_[ind_posfila_[ind]].second) {
        throw(runtime_error("Erro na operacao diminui_prio: a nova prioridade"
            " (" + to_string(prio) + ") do item de indice " + to_string(ind) +
            " nao eh menor que a sua atual prioridade (" +
            to_string(itens_[ind_posfila_[ind]].second) + ")!"));
    }

    itens_[ind_posfila_[ind]].second = prio;

    conserta_para_cima(ind_posfila_[ind]);
}

template <typename T>
int Filapri_min<T>::pai(int i) {
    return ((i - 1) / 2);
}

template <typename T>
int Filapri_min<T>::filho_esq(int i) {
    return ((2 * i) + 1);
}

template <typename T>
int Filapri_min<T>::filho_dir(int i) {
    return ((2 * i) + 2);
}

template <typename T>
void Filapri_min<T>::troca(int i, int j) {
    swap(itens_[i], itens_[j]);

    ind_posfila_[itens_[i].first] = i;
    ind_posfila_[itens_[j].first] = j;
}

template <typename T>
void Filapri_min<T>::conserta_para_cima(int i) {
    while (i > 0) {
        if (itens_[i].second >= itens_[pai(i)].second) {
            break;
        }

        troca(i, pai(i));

        i = pai(i);
    }
}

template <typename T>
void Filapri_min<T>::conserta_para_baixo(int i) {
    int menor_filho;

    while (filho_esq(i) < num_itens_) {
        menor_filho = filho_esq(i);
        if (filho_dir(i) < num_itens_) {
            if (itens_[filho_dir(i)].second < itens_[filho_esq(i)].second) {
                menor_filho = filho_dir(i);
            }
        }

        if (itens_[i].second <= itens_[menor_filho].second) {
            break;
        }

        troca(i, menor_filho);

        i = menor_filho;
    }
}

template <typename T>
void Filapri_min<T>::valida_indice(int ind) {
    if ((ind < 0) || (ind >= max_num_itens_)) {
        throw out_of_range("Indice invalido: " + to_string(ind));
    }
}

template class Filapri_min<int>;
