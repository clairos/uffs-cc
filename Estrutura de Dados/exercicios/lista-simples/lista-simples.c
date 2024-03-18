#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct tfunc{

  int id;
  char name[21];
  float income;
  struct tfunc *next;

};
typedef struct tfunc vfunc;

vfunc *insFunc(vfunc *frt, int id){
  vfunc *f, *aux = NULL;
  int i;
  for (i = 1; i <= 10; i++){
    f = (vfunc *) malloc(sizeof(vfunc));
    f->id = id;
    strcpy(f->name, "Primeiro");
    f->income = i*1000.5;
    f->next = NULL;
    aux = f;
    if (frt == NULL){
      frt = f;
      aux = f;
    }else aux -> next = f;
    aux = f;
    return frt;
}

int main(){

  vfunc *f, *aux, *first = NULL;
  int i;
  for (i = 1; i <= 10; i++){
    first = insFunc(first, i);
  }
  for (aux = first; aux != NULL; aux = aux->next){
    
  }
}