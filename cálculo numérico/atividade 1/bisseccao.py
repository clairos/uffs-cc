import math

def bisseccao(f, a, b, precisao):
    if f(a) * f(b) >= 0:
        raise ValueError("f(a) e f(b) devem ter sinais opostos.")

    if b - a < precisao:
        return (a + b) / 2

    k = 1
    M = f(a)

    while True:
        x = (a + b) / 2

        if M * f(x) > 0:
            a = x
        else:
            b = x

        if b - a < precisao:
            return (a + b) / 2

        k += 1

funcao = input("Digite a função f(x): ")
funcao = funcao.replace('^', '**').replace('ln', 'log')

a = float(input("Digite o valor de a: "))
b = float(input("Digite o valor de b: "))
precisao = float(input("Digite a precisão ε (ex.: 0.0001): "))

math_funcs = {q: getattr(math, q) for q in dir(math) if not q.startswith("__")}

def f(x):
    return eval(funcao, {**math_funcs, "x": x})

try:
    raiz = bisseccao(f, a, b, precisao)
    print(f"Raiz aproximada: {raiz:.6f}")
except Exception as e:
    print(f"Erro: {e}")