import math 

def secante(f, x0, x1, precisao):
    if abs(f(x0)) < precisao:
        alpha = x0
        return alpha
    
    if abs(f(x1)) < precisao or abs(x1-x0) < precisao:
        alpha = x1
        return alpha
    
    k = 1

    while True:
        if f(x1) == f(x0):
            raise ValueError("Divisão por zero na fórmula da secante.")

        eq = (f(x1) / ((f(x1) - f(x0)))) * (x1 - x0)
        x2 = x1 - eq

        if abs(f(x2)) < precisao or abs(x2 - x1) < precisao:
            alpha = x2
            return alpha
        
        x0 = x1
        x1 = x2

        k += 1
    
    return None

funcao = input("Digite a função f(x): ")
funcao = funcao.replace('^', '**').replace('ln', 'log')

x0 = float(input("Digite o valor inicial x0: "))
x1 = float(input("Digite o valor inicial x1: "))
precisao = float(input("Digite a precisão ε: "))

math_funcs = {q: getattr(math, q) for q in dir(math) if not q.startswith("__")}

def f(x):
    return eval(funcao, {**math_funcs, "x": x})

try:
    raiz = secante(f, x0, x1, precisao)
    if raiz is not None:
        print(f"Raiz aproximada: {raiz:.6f}")
except Exception as e:
    print(f"Erro: {e}")