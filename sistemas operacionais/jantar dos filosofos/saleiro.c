    #include <stdio.h>
    #include <stdlib.h>
    #include <unistd.h>
    #include <pthread.h>
    #include <semaphore.h>

    #define NUMFILO 5

    pthread_t filosofo[NUMFILO];
    sem_t hashi[NUMFILO];
    sem_t saleiro;

    char *space[] = {"", "\t", "\t\t", "\t\t\t", "\t\t\t\t"};

    void espera(int n)
    {
        sleep(random() % n);
        usleep(random() % 1000000);
    }

    void come(int f)
    {
        printf("%sF%d COMENDO\n", space[f], f);
        espera(1);
    }

    void medita(int f)
    {
        printf("%sF%d meditando\n", space[f], f);
        espera(1);
    }

    void pega_hashi(int f, int h)
    {
        printf("%sF%d quer  h%d\n", space[f], f, h);
        sem_wait(&hashi[h]);
        printf("%sF%d pegou h%d\n", space[f], f, h);
    }

    void larga_hashi(int f, int h)
    {
        printf("%sF%d larga h%d\n", space[f], f, h);
        sem_post(&hashi[h]);
    }

    void *threadFilosofo(void *arg)
    {
        int i = (long int)arg;
        while (1)
        {
            medita(i);
            sem_wait(&saleiro);
            pega_hashi(i, i);
            pega_hashi(i, (i + 1) % NUMFILO);
            sem_post(&saleiro);
            come(i);
            larga_hashi(i, i);
            larga_hashi(i, (i + 1) % NUMFILO);
        }
        pthread_exit(NULL);
    }

    int main(int argc, char *argv[])
    {
        long i, status;

        setvbuf(stdout, 0, _IONBF, 0);

        for (i = 0; i < NUMFILO; i++)
            sem_init(&hashi[i], 0, 1);

        sem_init(&saleiro, 0, 1);

        for (i = 0; i < NUMFILO; i++)
        {
            status = pthread_create(&filosofo[i], NULL, threadFilosofo, (void *)i);
            if (status)
            {
                perror("pthread_create");
                exit(1);
            }
        }

        pthread_exit(NULL);
    }