// Trabalho Final de Estrutura de Dados 2022

// Alunos
// Ana Clara Brusamarello Barbosa 2121101054
// Jonathan Gotz Correa 2121101052

// Professores: Denio Duarte, Geomar Schreiner

//  ⡴⠑⡄⠀⠀⠀⠀⠀⠀⠀ ⣀⣀⣤⣤⣤⣀⡀
// ⠸⡇⠀⠿⡀⠀⠀⠀⣀⡴⢿⣿⣿⣿⣿⣿⣿⣿⣷⣦⡀
// ⠀⠀⠀⠀⠑⢄⣠⠾⠁⣀⣄⡈⠙⣿⣿⣿⣿⣿⣿⣿⣿⣆ bão
// ⠀⠀⠀⠀⢀⡀⠁⠀⠀⠈⠙⠛⠂⠈⣿⣿⣿⣿⣿⠿⡿⢿⣆
// ⠀⠀⠀⢀⡾⣁⣀⠀⠴⠂⠙⣗⡀⠀⢻⣿⣿⠭⢤⣴⣦⣤⣹⠀⠀⠀⢀⢴⣶⣆
// ⠀ ⢀⣾⣿⣿⣿⣷⣮⣽⣾⣿⣥⣴⣿⣿⡿⢂⠔⢚⡿⢿⣿⣦⣴⣾⠸⣼⡿
// ⠀⢀⡞⠁⠙⠻⠿⠟⠉⠀⠛⢹⣿⣿⣿⣿⣿⣌⢤⣼⣿⣾⣿⡟⠉
// ⠀⣾⣷⣶⠇⠀⠀⣤⣄⣀⡀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇	pó da 10
// ⠀⠉⠈⠉⠀⠀⢦⡈⢻⣿⣿⣿⣶⣶⣶⣶⣤⣽⡹⣿⣿⣿⣿⡇
// ⠀⠀⠀⠀⠀⠀⠀⠉⠲⣽⡻⢿⣿⣿⣿⣿⣿⣿⣷⣜⣿⣿⣿⡇
// ⠀⠀ ⠀⠀⠀⠀⠀⢸⣿⣿⣷⣶⣮⣭⣽⣿⣿⣿⣿⣿⣿⣿⠇
// ⠀⠀⠀⠀⠀⠀⣀⣀⣈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇
// ⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>

/****************** declaração de structs *************/
typedef struct Bebida
{
    int idBebida;
    char nomeBebida[20];
    int mls;
    float preco;
    int estoque;
    int alcoolica;
    struct Bebida *next, *previous;
}

tBebida;

typedef struct Cliente
{
    int idCliente;
    char nomeCliente[20];
    char cpf[14];
    int idade;
    int vendeFiado;
    struct Cliente *next, *previous;
}

tCliente;

typedef struct ListaBebida
{
    tBebida *start_b;
    tBebida *end_b;
}

tListaBebida;

typedef struct ListaCliente
{
    tCliente *start_c;
    tCliente *end_c;
}

tListaCliente;
/******************************************************/

/****************** declaração de funções *************/
void menu();

void boraListaBebida(tListaBebida *lista_b);

void boraListaCliente(tListaCliente *lista_b);

tBebida *lerInputBebida();

int cadastrarBebida(tListaBebida *lista_b);

void mostrarBebida(tBebida *aux);

void mostrarBebidas(tListaBebida *lista_b);

void comprarBebida(tListaBebida *lista_b);

void venderBebida(tListaBebida *lista_b, tListaCliente *lista_c);

tCliente *lerInputCliente();

int cadastrarCliente(tListaCliente *lista_c);

void mostrarClientes(tListaCliente *lista_c);
/******************************************************/

int main()
{
    tListaBebida lista_b;
    tListaCliente lista_c;

    boraListaBebida(&lista_b);
    boraListaCliente(&lista_c);

    int opcao = 1;

    // system("clear");
    menu();

    do
    {
        scanf("%d", &opcao);

        switch (opcao)
        {
        case 1:
            cadastrarBebida(&lista_b);
            break;
        case 2:
            mostrarBebidas(&lista_b);
            break;
        case 3:
            comprarBebida(&lista_b);
            break;
        case 4:
            venderBebida(&lista_b, &lista_c);
            break;
        case 5:
            cadastrarCliente(&lista_c);
            break;
        case 6:
            mostrarClientes(&lista_c);
            break;
        case 69: // easter eggzinho de lei!!
            printf("...\n");
            printf("oh\n");
            printf("hehe\n");
            printf("noice\n");
            break;
        default:
            return 0;
        }
    } while (opcao != 7);

    return 0;
}

/********************* funções ************************/
// -------- printa menu ---------
void menu()
{
    printf("\n");
    printf("--------- MENU --------\n");
    printf("|1.| CADASTRAR BEBIDA\n");
    printf("|2.| MOSTRAR BEBIDAS\n");
    printf("|3.| COMPRAR BEBIDA\n");
    printf("|4.| VENDER BEBIDA\n");
    printf("|5.| CADASTRAR CLIENTE\n");
    printf("|6.| MOSTRAR CLIENTES\n");
    printf("|7.| SAIR\n");
    printf("-----------------------\n");
    printf("\n");
}
// ------------------------------

// ------ começa a lista 1 ------
void boraListaBebida(tListaBebida *lista_b)
{
    lista_b->start_b = NULL;
    lista_b->end_b = NULL;
}
// ------------------------------

// ------ começa a lista 2 ------
void boraListaCliente(tListaCliente *lista_c)
{
    lista_c->start_c = NULL;
    lista_c->end_c = NULL;
}
// ------------------------------

// ------ leitura de input ------
tBebida *lerInputBebida()
{
    tBebida *new;
    new = (tBebida *)malloc(sizeof(tBebida));

    printf("Informe o ID da bebida:  ");
    scanf("%d", &new->idBebida);

    printf("Informe o nome da bebida:  ");
    scanf("%s", new->nomeBebida);

    printf("Informe o conteúdo líquido em ml:  ");
    scanf("%d", &new->mls);

    printf("Informe o preço em R$:  ");
    scanf("%f", &new->preco);

    printf("Informe a quantidade em estoque:  ");
    scanf("%d", &new->estoque);

    printf("Se a bebida seja alcoólica digite 1, se não, digite 0:  ");
    scanf("%d", &new->alcoolica);

    return new;
}
// ------------------------------

// ---- cadastra bebida nova ----
int cadastrarBebida(tListaBebida *lista_b)
{
    tBebida *new, *aux = lista_b->start_b;
    new = (tBebida *)malloc(sizeof(tBebida));
    bool erro = false;

    new = lerInputBebida();

    if (lista_b->start_b == NULL)
    {
        new->previous = NULL;
        new->next = NULL;
        lista_b->start_b = new;
        lista_b->end_b = new;
        printf("Nova bebida foi cadastrada com sucesso!\n\n");
    }
    else
    {
        while (aux != NULL)
        {
            if (aux->idBebida == new->idBebida)
            {
                erro = true;
                break;
            }

            aux = aux->next;
        }

        if (!erro)
        {
            new->next = NULL;
            new->previous = lista_b->end_b;
            lista_b->end_b->next = new;
            lista_b->end_b = new;
            printf("Nova bebida foi cadastrada com sucesso!\n\n");
        }
        else
        {
            printf("Bebida não cadastrada.\n");
            printf("Por favor, tente novamente, ou verifique se já não existe bebida com esse código.\n\n");
        }
    }

    menu();
}
// ------------------------------

// ------ lista uma bebida ------
void mostrarBebida(tBebida *aux)
{
    printf("Código: %d\n", aux->idBebida);
    printf("Nome: %s\n", aux->nomeBebida);
    printf("Quantidade de mLs: %d\n", aux->mls);
    printf("Preço de venda: R$%.2f\n", aux->preco);
    printf("Quantidade no estoque: %d\n", aux->estoque);
    printf("Bebida alcoólica? (1: Sim, 0: Não) %d\n", aux->alcoolica);
}
// ------------------------------

// --- lista todas as bebidas ---
void mostrarBebidas(tListaBebida *lista_b)
{
    tBebida *aux;
    aux = lista_b->start_b;

    if (aux == NULL)
    {
        printf("Nenhuma bebida foi cadastrada ainda.\n\n");
    }
    else
    {
        printf("---------- BEBIDAS -----------\n");

        while (aux != NULL)
        {
            mostrarBebida(aux);
            printf("------------------------------\n");
            aux = aux->next;
        }
    }

    menu();
}
// ------------------------------

// --- compra bebida (estoque) --
void comprarBebida(tListaBebida *lista_b)
{
    tBebida *previous, *current;
    int id, qtd;

    while (1)
    {
        printf("Informe o código da bebida que deseja comprar: ");
        scanf("%d", &id);

        if (id > 0)
        {
            break;
        }
    }

    while (1)
    {
        printf("Informa a quantidade a ser comprada: ");
        scanf("%d", &qtd);

        if (qtd > 0)
        {
            break;
        }
    }

    if (lista_b->start_b == NULL)
    {
        printf("Nenhuma bebida foi cadastrada ainda.\n\n");
    }
    else
    {
        previous = lista_b->start_b;
        current = lista_b->start_b;
        bool bebidaComprada = false;

        while (current != NULL)
        {
            if (current->idBebida == id)
            {
                bebidaComprada = true;
                current->estoque += qtd;
            }

            previous = current;
            current = current->next;
        }

        if (bebidaComprada)
        {
            printf("A bebida foi comprada com sucesso.\n\n");
        }
        else
        {
            printf("Erro ao comprar bebida.\n");
            printf("Verifique se existe bebida com esse código.\n\n");
        }
    }

    menu();
}
// ------------------------------

// ------- vende bebida ---------
void venderBebida(tListaBebida *lista_b, tListaCliente *lista_c)
{
    tBebida *previous_b, *current_b;
    tCliente *previous_c, *current_c;
    int id, qtd;
    char cpf[14];
    bool bebidaVendida = false;

    printf("Informe o CPF do cliente (Ex: 999.999.999-99): \n");
    scanf("%s", cpf);

    if (lista_c->start_c == NULL)
    {
        printf("Nenhum cliente foi cadastrado para venda.\n\n");
        return menu();
    }
    else
    {
        previous_c = lista_c->start_c;
        current_c = lista_c->start_c;

        while (current_c != NULL)
        {
            // previous_c = current_c;
            // current_c = current_c->next;

            if ((strcmp(cpf, current_c->cpf) == 0))
            {
                // printf("%s\n", current_c->cpf);
                printf("Informe o código da bebida: \n");
                scanf("%d", &id);

                // printf("Informe a idade do cliente: \n");
                // scanf("%d", &idade);

                if (lista_b->start_b == NULL)
                {
                    printf("Nenhuma bebida foi cadastrada ainda.\n\n");
                    return menu();
                }
                else
                {
                    previous_b = lista_b->start_b;
                    current_b = lista_b->start_b;

                    while (current_b != NULL)
                    {
                        if (current_b->idBebida == id)
                        {
                            if (current_b->alcoolica == 1)
                            {
                                if (current_c->idade < 18)
                                {
                                    printf("Proibido vender bebida alcoólica para clientes menores de 18 anos!\n\n");
                                    // break;
                                    return menu();
                                }
                                else
                                {
                                    printf("Informe a quantidade a ser vendida: \n");
                                    scanf("%d", &qtd);

                                    if (current_b->estoque >= qtd)
                                    {
                                        current_b->estoque -= qtd;
                                        bebidaVendida = true;
                                        printf("Venda feita com sucesso.\n\n");
                                        // break;
                                        return menu();
                                    }
                                    else
                                    {
                                        printf("Não há estoque suficiente para venda.\n\n");
                                        // break;
                                        return menu();
                                    }
                                }
                            }
                            else
                            {
                                printf("Informe a quantidade a ser vendida: \n");
                                scanf("%d", &qtd);

                                if (current_b->estoque >= qtd)
                                {
                                    current_b->estoque -= qtd;
                                    bebidaVendida = true;
                                    printf("Venda feita com sucesso.\n\n");
                                    return menu();
                                }
                                else
                                {
                                    printf("Não há estoque suficiente para venda.\n\n");
                                    return menu();
                                }
                            }
                        }

                        previous_b = current_b;
                        current_b = current_b->next;
                    }

                    if (!bebidaVendida)
                    {
                        printf("Erro ao vender bebida.\n");
                        printf("Verifique se há bebida cadastrada com esse código.\n\n");
                        // break;
                        return menu();
                    }
                }
            }
            else
            {
                previous_c = current_c;
                current_c = current_c->next;
            }
        }

        if (current_c == NULL)
        {
            printf("Cliente não encontrado!\n\n");
        }
    }

    menu();
}
// ------------------------------

// ------ leitura de input ------
tCliente *lerInputCliente()
{
    tCliente *new;
    new = (tCliente *)malloc(sizeof(tCliente));

    printf("Informe o ID do cliente: ");
    scanf("%d", &new->idCliente);

    printf("Informe o nome do cliente: ");
    scanf("%s", new->nomeCliente);

    printf("Informe o CPF do cliente (Ex. 999.999.999-99): ");
    scanf("%s", new->cpf);

    printf("Informe a idade do cliente: ");
    scanf("%d", &new->idade);

    printf("Informe se será permitido vender fiado para este cliente: (1: Sim, 0: Não) ");
    scanf("%d", &new->vendeFiado);

    return new;
}
// ------------------------------

// --- cadastra cliente novo ----
int cadastrarCliente(tListaCliente *lista_c)
{
    tCliente *new, *aux = lista_c->start_c;
    new = (tCliente *)malloc(sizeof(tCliente));
    bool erro = false;

    new = lerInputCliente();

    if (lista_c->start_c == NULL)
    {
        new->previous = NULL;
        new->next = NULL;
        lista_c->start_c = new;
        lista_c->end_c = new;
        printf("Novo cliente cadastrado com sucesso!\n\n");
    }
    else
    {
        while (aux != NULL)
        {
            if (aux->idCliente == new->idCliente)
            {
                erro = true;
                break;
            }

            aux = aux->next;
        }

        if (!erro)
        {
            new->next = NULL;
            new->previous = lista_c->end_c;
            lista_c->end_c->next = new;
            lista_c->end_c = new;
            printf("Novo cliente cadastrado com sucesso!\n\n");
        }
        else
        {
            printf("Cliente não cadastrado.\n");
            printf("Por favor, tente novamente, ou verifique se já não existe cliente com esse código.\n\n");
        }
    }

    menu();
}
// ------------------------------

// ------ lista clientes --------
void mostrarCliente(tCliente *aux)
{
    printf("Código: %d\n", aux->idCliente);
    printf("Nome: %s\n", aux->nomeCliente);
    printf("CPF: %s\n", aux->cpf);
    printf("Idade: %d\n", aux->idade);
    printf("Permite vender fiado? (1: Sim, 0: Não) %d\n", aux->vendeFiado);
}
// ------------------------------

// ------ lista clientes --------
void mostrarClientes(tListaCliente *lista_c)
{
    tCliente *aux;
    aux = lista_c->start_c;

    if (aux == NULL)
    {
        printf("Nenhum cliente foi cadastrado ainda.\n\n");
    }
    else
    {
        printf("---------- CLIENTES ----------\n");

        while (aux != NULL)
        {
            mostrarCliente(aux);
            printf("------------------------------\n");
            aux = aux->next;
        }
    }

    menu();
}
// ------------------------------
/******************************************************/