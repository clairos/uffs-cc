#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// --------- structs ------------
typedef struct Stack_Element {
  char endereco[60];
  struct Stack_Element *next;
} tStack_Element;

typedef struct {
  tStack_Element *head;
} tStack;
// ------------------------------


// ------ starta a pilha --------
void stackStart(tStack *Stack)
{
  Stack->head = NULL;
    
  return;
};
// ------------------------------


//--- adiciona elemento novo ----
void stackAdd(tStack *web, char *input)
{
  tStack_Element *aux;
  aux=malloc(sizeof(tStack_Element));
  
  strcpy(aux->endereco, input);
  aux->next = web->head;
  web->head = aux;
};
// ------------------------------


// ----- remove do stack --------
void stackRemove(tStack *stack)
{
  tStack_Element *aux;
  aux = stack->head;
  stack->head = stack->head->next;

  free(aux);
}
// ------------------------------


// ------ reseta a pilha -------
void stackLibera(tStack *stack) 
{
  tStack_Element *aux;
    
  while (stack->head != NULL)
  {
    aux=stack->head;
    stack->head = stack->head->next;
    printf("@\n");

    free(aux);
  }
}
// ------------------------------


int main()
{    
  char input[60];
  tStack *stack = (tStack *) malloc(sizeof(tStack));
    
  stackStart(stack);
  scanf("%s", input);
    
  while (strcmp(input, "E") != 0)
  {
    if (strcmp(input, "B") == 0){
      if (stack->head == NULL){ // verifica se a lista está vazia
        printf("Vazio\n");
      } else {
        printf("%s\n", stack->head->endereco);
        stackRemove(stack); 
      }
    } else {
      stackAdd(stack, input);
    }

    scanf("%s", input);
  }

  if (stack->head == NULL){
    printf("!");
  } else {
    stackLibera(stack); 
  }

  return 0;
}