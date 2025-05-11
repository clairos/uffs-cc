import math 
import sympy as sp

def newton(f, x0, precisao):
    f = f.replace('^', '**').replace('ln', 'log')
    x = sp.symbols('x')
    f_func = sp.sympify(f)
    f_derivada = sp.diff(f_func, x)

    f_func = sp.sympify(f, locals={"e": sp.E})
    f_derivada = sp.diff(f_func, x)

    f = sp.lambdify(x, f_func, modules=['math'])
    f_derivada = sp.lambdify(x, f_derivada, modules=['math'])

    if abs(f(x0)) < precisao:
        alpha = x0
        return alpha
    
    k = 1

    while True:
        x1 = x0 - (f(x0) / f_derivada(x0))
        
        if abs(f(x1)) < precisao or abs((x1 - x0)) < precisao:
            alpha = x1
            return alpha
        
        x0 = x1
        k += 1
    
    return None

funcao = input("Digite a função f(x): ")
x0 = float(input("Digite o valor inicial x0: "))
precisao = float(input("Digite a precisão ε: "))

math_funcs = {q: getattr(math, q) for q in dir(math) if not q.startswith("__")}

def f(x):
    return eval(funcao, {**math_funcs, "x": x, "e": math.e})

try:
    raiz = newton(funcao, x0, precisao)
    if raiz is not None:
        print(f"Raiz aproximada: {raiz:.6f}")
except Exception as e:
    print(f"Erro: {e}")