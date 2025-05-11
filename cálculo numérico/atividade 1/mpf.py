import math
import csv
import re

def salvar_resultado_csv(nome_arquivo, metodo, dados_iniciais, x_aprox, fx_aprox, erro, iteracoes):
    arquivo_existe = False
    try:
        with open(nome_arquivo, mode='r', encoding='utf-8') as arquivo:
            arquivo_existe = True
    except FileNotFoundError:
        pass
    
    with open(nome_arquivo, mode='a', newline='', encoding='utf-8') as arquivo:
        writer = csv.writer(arquivo)
        
        if not arquivo_existe:
            writer.writerow(["Método", "Dados iniciais", "x aproximado", "f(x) aproximado", "Erro em x", "Nº de iterações"])
        
        writer.writerow([metodo, dados_iniciais, f"{x_aprox:.8f}", f"{fx_aprox:.8e}", f"{erro:.8e}", iteracoes])

def mpf(f, phi, x0, precisao):
    if abs(f(x0)) < precisao:
        alpha = x0
        return alpha, f(alpha), 0.0, 0
    
    k = 1

    while True:
        x1 = phi(x0)

        if abs(f(x1)) < precisao or abs(x1 - x0) < precisao:
            alpha = x1
            return alpha, f(alpha), abs(x1 - x0), k
        
        x0 = x1
        k += 1
    
    return None, None, None, None

f_func = input("Digite a função f(x): ")
f_func = f_func.replace('^', '**').replace('ln', 'log')
f_func = re.sub(r'e\^\(([^)]+)\)', r'exp(\1)', f_func)
f_func = re.sub(r'e\^([^\s\+\-\*/\^]+)', r'exp(\1)', f_func)

phi_func = input("Digite a função φ(x): ")
phi_func = phi_func.replace('^', '**').replace('ln', 'log')
phi_func = re.sub(r'e\^\(([^)]+)\)', r'exp(\1)', phi_func)
phi_func = re.sub(r'e\^([^\s\+\-\*/\^]+)', r'exp(\1)', phi_func)

x0 = float(input("Digite o valor inicial x0: "))
precisao = float(input("Digite a precisão ε: "))

math_funcs = {q: getattr(math, q) for q in dir(math) if not q.startswith("__")}
contexto_base = {**math_funcs, "e": math.e, "pi": math.pi}

def f(x):
    return eval(f_func, {**contexto_base, "x": x})

def phi(x):
    return eval(phi_func, {**contexto_base, "x": x})

try:
    raiz, fx_aprox, erro, iteracoes = mpf(f, phi, x0, precisao)
    if raiz is not None:
        print(f"Raiz aproximada: {raiz:.8f}")

        dados_iniciais = f"x0={x0}, ε={precisao}"
        salvar_resultado_csv("metodos.csv", "Ponto Fixo", dados_iniciais, raiz, fx_aprox, erro, iteracoes)

except Exception as e:
    print(f"Erro: {e}")
