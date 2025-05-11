import math
import csv
import sympy as sp

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

def secante(f, x0, x1, precisao):
    if abs(f(x0)) < precisao:
        return x0, f(x0), 0.0, 0
    
    if abs(f(x1)) < precisao or abs(x1 - x0) < precisao:
        return x1, f(x1), abs(x1 - x0), 0
    
    k = 1
    while True:
        fx0 = f(x0)
        fx1 = f(x1)
        if fx1 == fx0:
            raise ValueError("Divisão por zero na fórmula da secante.")
        
        x2 = x1 - fx1 * (x1 - x0) / (fx1 - fx0)

        if abs(f(x2)) < precisao or abs(x2 - x1) < precisao:
            return x2, f(x2), abs(x2 - x1), k
        
        x0 = x1
        x1 = x2
        k += 1

funcao_input = input("Digite a função f(x): ")
funcao_input = funcao_input.replace('^', '**')
x0 = float(input("Digite o valor inicial x0: "))
x1 = float(input("Digite o valor inicial x1: "))
precisao = float(input("Digite a precisão ε: "))

x = sp.symbols('x')
func_expr = sp.sympify(funcao_input, locals={'e': sp.E})
f = sp.lambdify(x, func_expr, modules=['sympy'])

try:
    raiz, fx_aprox, erro, iteracoes = secante(f, x0, x1, precisao)
    if raiz is not None:
        print(f"Raiz aproximada: {raiz:.8f}")
        dados_iniciais = f"x0={x0}, x1={x1}, ε={precisao}"
        salvar_resultado_csv("metodos.csv", "Secante", dados_iniciais, raiz, fx_aprox, erro, iteracoes)
except Exception as e:
    print(f"Erro: {e}")
