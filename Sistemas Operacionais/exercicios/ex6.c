#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

#define NUM_THREADS 4

typedef struct {
    int start;
    int end;
    long long int sum;
} ThreadArgs;

void *partialSum(void *arg) {
    ThreadArgs *args = (ThreadArgs *)arg;
    args->sum = 0;
    printf("Thread criada para calcular a soma de %d a %d\n", args->start, args->end);
    for (int i = args->start; i <= args->end; ++i) {
        args->sum += i;
    }
    printf("Thread concluiu a soma de %d a %d: %lld\n", args->start, args->end, args->sum);
    pthread_exit(NULL);
}

int main() {
    pthread_t threads[NUM_THREADS];
    ThreadArgs threadArgs[NUM_THREADS];
    long long int totalSum = 0;

    int numbersPerThread = 1000 / NUM_THREADS;
    
    for (int i = 0; i < NUM_THREADS; ++i) {
        threadArgs[i].start = i * numbersPerThread + 1;
        threadArgs[i].end = (i + 1) * numbersPerThread;
        if (i == NUM_THREADS - 1) {
            threadArgs[i].end = 1000;
        }
        pthread_create(&threads[i], NULL, partialSum, (void *)&threadArgs[i]);
    }
    
    for (int i = 0; i < NUM_THREADS; ++i) {
        pthread_join(threads[i], NULL);
        totalSum += threadArgs[i].sum;
    }

    printf("Soma total: %lld\n", totalSum);

    return 0;
}
