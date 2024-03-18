#include <stdio.h>
#include <stdlib.h>

void bubble_sort(int arr[], int tam) 
{
    int i, j, aux;

    for (i = 0; i < tam; i++) 
    {
        for (j = 0; j < (tam - 1); j++)
        {
            if (arr[j] > arr[j + 1])
            {
                aux = arr[j]; 
                arr[j] = arr[j + 1];
                arr[j + 1] = aux;
            }
        }
    }
}

int main()
{
    int i, tam = 5, arr[5] = {5, 4, 3, 2, 1};

    for (i = 0; i < tam; i++)
    {
        printf("arr[%d]=%d\n", i, arr[i]); 
    }

    bubble_sort(arr, tam);
    printf("-----------------------------\n");

    for (i = 0; i < tam; i++)
    {
        printf("arr[%d]=%d\n", i, arr[i]);
    }

    return 0;
}