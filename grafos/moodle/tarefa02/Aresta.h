/*
 * Tarefa 04 - Grafeira Linhas Aereas
 *
 * GEN254 - Grafos - 2024/1
 *
 * Nomes: Ana Clara Brusamarello Barbosa e Richard Facin Souza
 * Matricula: 2121101054 e 2211101002
 */

#ifndef ARESTA_H

#define ARESTA_H

class Aresta {
    public:
        const int v1;
        const int v2;      
        const int peso;  
        
        Aresta(int v1, int v2, int peso); 
};

#endif /* ARESTA_H */
