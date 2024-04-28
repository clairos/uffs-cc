```c
inicializar_semaforos()

function usar_saleiro(id_usuario)
    aguardar(acesso_saleiro)
    aguardar(saleiro_mutex)
    imprimir("usuario " + id_usuario + " está usando o saleiro.")
    imprimir("usuario " + id_usuario + " terminou de usar o saleiro.")
    liberar(saleiro_mutex)
    liberar(acesso_saleiro)

function principal()
    inicializar_semaforos()

    para cada usuario de 1 a MAX_USUARIOS faça
        criar_thread(usar_saleiro, usuario)
    
    para cada thread criada faça
        aguardar_termino(thread)

    destruir_semaforos()
```