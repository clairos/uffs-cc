#include <stdio.h>

struct tfloat {
  int inteiro;
  int decimal;
};
typedef struct tfloat mfloat;

void printFloat(mfloat f){
  printf("%d,%d\n", f.inteiro, f.decimal);
  return;
}

/*
void setFloat(mfloat *f, int i, int d){
  f->inteiro=i;
  f->decimal=d;
}
*/

mfloat setFloat(int i, int d){
  mfloat f;
  f.inteiro = i;
  f.decimal = d;
  return f;
}

mfloat sumFloat(mfloat f1, mfloat f2){
  mfloat r;
  r.inteiro =  f1.inteiro + f2.inteiro; 
  r.decimal = f1.decimal + f2.decimal;
  if (r.decimal > 9){
    r.decimal -= 10;
    r.inteiro++;
  } 
  return r;
}

int main(){
  mfloat x,y,n;
  x = setFloat(7,6);
  y = setFloat(7,7);

  printFloat(x);
  printFloat(y);

  n = sumFloat(x,y);
  printFloat(n);

  printFloat(sumFloat(n,y));
  
  return 0;
}