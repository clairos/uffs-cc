#include <stdio.h>

int divInt(int a, int b){
  if (a<b) return 0;
  return divInt(a-b, b)+1;
}

int main() {
   printf("14 div 3 = %d\n", divInt(14,3));
   printf("20 div 25 = %d\n", divInt(20,25));
   printf("30 div 6 = %d\n", divInt(30,6));
  
  return 0;
}