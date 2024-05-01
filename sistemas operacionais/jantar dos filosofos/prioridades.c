#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>
#include <semaphore.h>
#include <time.h>
#include <math.h>
#include <string.h>

#define NUMFILO 5
#define TEST_DURATION 60
#define NUM_TESTS 10

pthread_t filosofo[NUMFILO];
sem_t hashi[NUMFILO];
int eat_count[NUMFILO];
int priority[NUMFILO] = {4, 3, 2, 1, 0};  
pthread_mutex_t mutex;
pthread_cond_t cond[NUMFILO];

void pega_hashi(int f, int h) {
    pthread_mutex_lock(&mutex);
    while (priority[h] > priority[f]) {
        pthread_cond_wait(&cond[f], &mutex);
    }
    sem_wait(&hashi[h]); 
    pthread_mutex_unlock(&mutex);
}

void larga_hashi(int f, int h) {
    pthread_mutex_lock(&mutex);
    sem_post(&hashi[h]);  
    pthread_cond_signal(&cond[h]);  
    pthread_mutex_unlock(&mutex);
}

void come(int f) {
    eat_count[f]++;  
}

void *threadFilosofo(void *arg) {
    int philosopher_id = *(int *)arg;
    int left = philosopher_id;  
    int right = (philosopher_id + 1) % NUMFILO; 
    int first = left < right ? left : right;  
    int second = left < right ? right : left; 

    time_t start_time, current_time;
    time(&start_time); 

    while (1) {
        time(&current_time);
        if (difftime(current_time, start_time) > TEST_DURATION) 
            break;

        pega_hashi(philosopher_id, first);
        pega_hashi(philosopher_id, second);
        come(philosopher_id);
        larga_hashi(philosopher_id, first);
        larga_hashi(philosopher_id, second);
    }

    pthread_exit(NULL);
}

int main(int argc, char *argv[]) {
    setvbuf(stdout, 0, _IONBF, 0); 
    pthread_mutex_init(&mutex, NULL);
    for (int i = 0; i < NUMFILO; i++) {
        sem_init(&hashi[i], 0, 1);
        pthread_cond_init(&cond[i], NULL);
    }

    int total_eats, test;
    double mean, variance, std_deviation;

    for (test = 0; test < NUM_TESTS; test++) {
        total_eats = 0;
        memset(eat_count, 0, sizeof(eat_count));  

        for (int i = 0; i < NUMFILO; i++) {
            args[i] = i;
            if (pthread_create(&filosofo[i], NULL, threadFilosofo, &args[i])) {
                perror("pthread_create");
                exit(1);
            }
        }

        for (int i = 0; i < NUMFILO; i++) {
            pthread_join(filosofo[i], NULL);
        }

      
        for (int i = 0; i < NUMFILO; i++) {
            total_eats += eat_count[i];
        }

        mean = (double)total_eats / NUMFILO;
        variance = 0;
        for (int i = 0; i < NUMFILO; i++) {
            variance += (eat_count[i] - mean) * (eat_count[i] - mean);
        }
        variance /= NUMFILO;
        std_deviation = sqrt(variance);

        printf("Teste %d: Total de comidas = %d, Média
