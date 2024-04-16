#include <stdio.h>
#include <stdlib.h>

void gremio(int arr[], int start, int mid, int end)
{
    int tam1 = mid - start + 1;
    int tam2 = end - mid;

    int l[tam1], r[tam2]; 

    for (int i=0; i<tam1; i++) 
        l[i] = arr[start+i];

    for (int j=0; j<tam2; j++)
        r[j] = arr[mid+1+j];

    int i=0, j=0, k=start;

    while (i<tam1 && j<tam2)
    {
        if (l[i] <= r[j])
        {
            arr[k] = l[i];
            i++;
        }
        else
        {
            arr[k] = r[j];
            j++;
        }
        k++;
    }

    while (i < tam1) 
    {
        arr[k] = l[i];
        i++;
        k++;
    }

    while (j < tam2)
    {
        arr[k] = r[j];
        j++;
        k++;
    }
}

void merge_sort(int arr[], int start, int end)
{
    if (start < end)
    {
        int mid = (start + end)/2;

        merge_sort(arr, start, mid);
        merge_sort(arr, mid+1, end);
        
        gremio(arr, start, mid, end);    
    }
}

int main()
{
    int arr[10], size = sizeof(arr)/sizeof(arr[10]);

    printf("digite 10 números inteiros:\n");

    for (int i=0; i<size; i++)
    {
        scanf("%d", &arr[i]);
    }
    printf("----------------------------\n");
    
    printf("unsorted array: \n");
    for(int i=0; i<size; i++)
    {
        printf("arr[%d] = %d\n", i, arr[i]);
    }
    printf("----------------------------\n");

    merge_sort(arr, 0, size-1);
    
    printf("sorted array: \n");
    for(int i=0; i<size; i++)
    {
        printf("arr[%d] = %d\n", i, arr[i]);
    }

    return 0;
}