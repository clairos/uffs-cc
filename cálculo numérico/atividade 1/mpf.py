import math

def mpf(f, phi, x0, precisao):
    if abs(f(x0)) < precisao:
        alpha = x0
        print (f"Raiz encontrada: {alpha}")
        return alpha
    
    k = 1

    while True:
        x1 = phi(x0)

        if abs(f(x1)) < precisao or abs(x1 - x0) < precisao:
            alpha = x1
            return alpha
        
        x0 = x1
        k += 1
    
    print (f"Raiz não encontrada após {max_iter} iterações.")
    return None

f_func = input("Digite a função f(x): ")
f_func = f_func.replace('^', '**').replace('ln', 'log')
phi_func = input("Digite a função φ(x): ")
phi_func = phi_func.replace('^', '**').replace('ln', 'log')

x0 = float(input("Digite o valor inicial x0: "))
precisao = float(input("Digite a precisão ε: "))

math_funcs = {q: getattr(math, q) for q in dir(math) if not q.startswith("__")}

def f(x):
    return eval(f_func, {**math_funcs, "x": x})

def phi(x):
    return eval(phi_func, {**math_funcs, "x": x})

try:
    raiz = mpf(f, phi, x0, precisao)
    if raiz is not None:
        print(f"Raiz aproximada: {raiz:.6f}")
except Exception as e:
    print(f"Erro: {e}")