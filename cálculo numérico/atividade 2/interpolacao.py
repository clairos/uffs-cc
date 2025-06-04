import time
from math import factorial

def lagrange(n, x, y, z):
    counter = 0
    result = 0

    for i in range(n):
        c = 1
        d = 1
        
        for j in range(n):
            if i != j:
                c *= (z - x[j])
                d *= (x[i] - x[j])
                counter += 2 

        result += (c / d) * y[i]
        counter += 2

    return result, counter

def gregory_newton(n, x, y, z):
    counter = 0
    deltay = [[0 for _ in range(n)] for _ in range(n)]
    
    for i in range(n):
        deltay[i][0] = y[i]
        counter += 1
    
    for j in range(1, n):
        for i in range(n - j):
            deltay[i][j] = deltay[i + 1][j - 1] - deltay[i][j - 1]
            counter += 1
    
    h = x[1] - x[0]
    u = (z - x[0]) / h

    result = deltay[0][0]
    t = 1

    for i in range(1, n):
        t *= (u - (i - 1))
        result += (t * deltay[0][i]) / factorial(i)
        counter += 2
    
    return result, counter

def verifica_intervalo(x, tolerancia=1e-9):
    h = x[1] - x[0]

    for i in range(1, len(x) - 1):
        hi = x[i + 1] - x[i]

        if abs(hi - h) > tolerancia:
            return False, None

    return True, h

n = int(input("Digite o número de pontos: "))

x = []
y = []

print("Digite os valores nos pares (x, y): ")

for i in range(n):
    xi = float(input(f"x[{i}]: "))
    yi = float(input(f"y[{i}]: "))
    x.append(xi)
    y.append(yi)

z = float(input("Digite o valor de z (ponto para a interpolação): "))

# Lagrange
start_lag = time.time()
result_lag, count_lag = lagrange(n, x, y, z)
end_lag = time.time()
time_lag = end_lag - start_lag

# Gregory Newton
uniforme, h = verifica_intervalo(x)
if not uniforme:
    newton = False
else:
    newton = True
    start_newton = time.time()
    result_newton, count_newton = gregory_newton(n, x, y, z)
    end_newton = time.time()
    time_newton = end_newton - start_newton

print("----------------------------- RESULTADOS ------------------------------")
print("LAGRANGE")
print(f"Resultado: {result_lag}, Contador: {count_lag}, Tempo: {time_lag:.6f} segundos")
print("-----------------------------------------------------------------------")
print("GREGORY NEWTON")
if newton:
    print(f"Resultado: {result_newton}, Contador: {count_newton}, Tempo: {time_newton:.6f} segundos")
else:
    print("Não calculado devido ao espaçamento irregular dos pontos.")

if newton:
    print("--------------------------- EFICIÊNCIA --------------------------------")

    print("Em quantidade de operações... ")
    if count_lag < count_newton:
        print("Lagrange é mais eficiente.")
    elif count_lag > count_newton:
        print("Gregory Newton é mais eficiente.")
    else:
        print("Ambos os métodos têm a mesma eficiência.")

    print("------------------------------------------------------------------------")

    print("Em tempo de execução... ")
    if time_lag < time_newton:
        print("Lagrange é mais rápido.")
    elif time_lag > time_newton:
        print("Gregory Newton é mais rápido.")
    else:
        print("Ambos os métodos têm o mesmo tempo de execução.")