#include <stdio.h>

void swap(int *a, int *b)
{
    int t = *a;
    *a = *b;
    *b = t;
}

int partition(int arr[], int head, int tail)
{
    int pivo = tail, i = head;

    for (int j = head; j < tail; j++)
    {
        if (arr[j] <= arr[pivo])
        {   
            swap(&arr[i], &arr[j]);
            i++;
        }
    }

    if (arr[i] > arr[pivo])
    {
        swap(&arr[i], &arr[pivo]);
    }

    return pivo;
}

void quick_sort(int arr[], int head, int tail)
{
    if (head < tail)
    {
        int pivo = partition(arr, head, tail);

        quick_sort(arr, head, pivo-1);
        quick_sort(arr, pivo+1, tail);
    }
}

int main()
{
    int arr[10] = {7,10,13,-9,0,19,27,5,-4, 9}, size;
    size = sizeof(arr)/sizeof(arr[10]);

    quick_sort(arr, 0, size-1);

    for (int i = 0; i < size; i++)
    {
        printf("arr[%d] = %d\n", i, arr[i]);
    }

    return 0;
}