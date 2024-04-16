#include <stdio.h>

int main()
{
    int i, j, aux, v[5] = {4, 5, 2, 1, 3};
    int size = sizeof(v)/sizeof(v[5]);

    for (i = 1; i < size; i++) 
    {
        aux = v[i];
        for (j = i; (j > 0) && (aux < v[j - 1]); j--) 
        {
            v[j] = v[j - 1];
        }

        v[j] = aux;
    }

    for (i = 0; i < 5; i++)
    {
        printf("v[%d] = %d\n", i, v[i]);
    }

    return 0;
}