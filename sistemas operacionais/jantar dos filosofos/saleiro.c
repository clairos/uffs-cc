#include <stdio.h>
#include <stdint.h>
#include <pthread.h>
#include <semaphore.h>

#define MAX_USUARIOS 5

sem_t saleiro_mutex;
sem_t acesso_saleiro;

void inicializar() {
    sem_init(&saleiro_mutex, 0, 1);
    sem_init(&acesso_saleiro, 0, MAX_USUARIOS);
}

void destruir() {
    sem_destroy(&saleiro_mutex);
    sem_destroy(&acesso_saleiro);
}

void usar_saleiro(int id_usuario) {
    sem_wait(&acesso_saleiro);
    
    sem_wait(&saleiro_mutex);
    printf("Usuário %d está usando o saleiro...\n", id_usuario);
    printf("Usuário %d terminou de usar o saleiro.\n", id_usuario);
    sem_post(&saleiro_mutex);
    
    sem_post(&acesso_saleiro);
}

int main() {
    inicializar();

    pthread_t usuarios[MAX_USUARIOS];
    for (int i = 0; i < MAX_USUARIOS; i++) {
        pthread_create(&usuarios[i], NULL, (void *)usar_saleiro, (void *)(intptr_t)i);
    }

    for (int i = 0; i < MAX_USUARIOS; i++) {
        pthread_join(usuarios[i], NULL);
    }

    destruir();

    return 0;
}
