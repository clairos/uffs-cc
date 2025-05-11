import math

def posicao_falsa(f, a, b, precisao1, precisao2):
    if f(a) * f(b) >= 0:
        raise ValueError("f(a) e f(b) devem ter sinais opostos.")
    
    if b - a < precisao1:
        return (a + b) / 2

    if abs(f(a)) < precisao2:
        return a

    if abs(f(b)) < precisao2:
        return b 
    
    k = 1
    M = f(a) 

    while True:
        x = ((a * f(b)) - (b * f(a))) / (f(b) - f(a))

        if abs(f(a)) < precisao2:
            return x
        
        if abs(M * f(x)) > 0:
            a = x
        else:
            b = x

        if b - a < precisao1:
            return (a+b)/2
        
        k += 1


funcao = input("Digite a função f(x): ")
funcao = funcao.replace('^', '**').replace('ln', 'log')

a = float(input("Digite o valor de a: "))
b = float(input("Digite o valor de b: "))
precisao1 = float(input("Digite a precisão ε1: "))
precisao2 = float(input("Digite a precisão ε2: "))

math_funcs = {q: getattr(math, q) for q in dir(math) if not q.startswith("__")}

def f(x):
    return eval(funcao, {**math_funcs, "x": x})

try:
    raiz = posicao_falsa(f, a, b, precisao1, precisao2)
    print(f"Raiz aproximada: {raiz:.6f}")
except Exception as e:
    print(f"Erro: {e}")