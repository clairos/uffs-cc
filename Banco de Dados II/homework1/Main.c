#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct DadosTable {
    int id;
    char nome_logico[20];
    char nome_fisico[20];
};

struct DadosAtt {
    int id;
    char nome_atributo[20];
    char tipo;
    char opcional;
    int tamanho;
};

void readFile(char* str);

int main(int argc, char** argv) {
    if(argc < 2) {
        printf("Erro: Falta o parâmetro com o nome da tabela\n");
        return -1;
    }

    readFile(argv[1]);

    return 0;
}

void readFile(char* str) {
    FILE* tabela = fopen("table.dic", "r");

    if (tabela == NULL) {
        printf("Erro: Arquivo table.dic não encontrado \n");
        return;
    }

    struct DadosTable dadosTabela;
    int achou = 0;
    
    while(fread(&dadosTabela, sizeof(dadosTabela), 1, tabela)) {
        if(strcmp(str, dadosTabela.nome_logico) == 0) {
            achou = 1;
            break;
        }
    }
    fclose(tabela);

    if (!achou) {
        printf("Erro: Tabela não encontrada!'\n");
        return;
    }

    FILE* atributo = fopen("att.dic", "r");

    fseek(atributo, 0, SEEK_END);
    long int tamArq = ftell(atributo);
    fseek(atributo, 0, SEEK_SET);

    struct DadosAtt *arr = (struct DadosAtt*) malloc(tamArq);
    struct DadosAtt aux;
    int cont = 0;

    while(fread(&aux, sizeof(aux), 1, atributo)) {
        if(aux.id == dadosTabela.id) {
            arr[cont] = aux;
            cont++;
        }
    }
    fclose(atributo);

    FILE* dadosArquivo = fopen(dadosTabela.nome_fisico, "r");

    if (dadosArquivo == NULL) {
        printf("Falha ao abrir arquivo: %s\n", dadosTabela.nome_fisico);
        free(arr);
        return;
    }

    for(int i = 0; i < cont; i++) {
        for(int j = 0; j < cont; j++) {
            printf("%s: ", arr[j].nome_atributo);
            switch (arr[j].tipo) {
                case 'I': {
                    int auxi;
                    fread(&auxi, arr[j].tamanho, 1, dadosArquivo);
                    printf("%d\n", auxi);
                    break;
                }
                case 'D': {
                    double auxd;
                    fread(&auxd, arr[j].tamanho, 1, dadosArquivo);
                    printf("%f\n", auxd);
                    break;
                }
                case 'S': {
                    char auxs[arr[j].tamanho];
                    fread(auxs, arr[j].tamanho, 1, dadosArquivo);
                    printf("%s\n", auxs);
                    break;
                }
            }
        }
        printf("-------------------------------------\n"); 
    }

    fclose(dadosArquivo);
    free(arr);
}
