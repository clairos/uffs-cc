import math
import sympy as sp
import pandas as pd
import os

def salvar_resultado_excel(nome_arquivo, metodo, dados_iniciais, x_aprox, fx_aprox, erro, iteracoes):
    dados = {
        "Método": [metodo],
        "Dados iniciais": [dados_iniciais],
        "x aproximado": [round(x_aprox, 8)],
        "f(x) aproximado": [f"{fx_aprox:.8e}"],
        "Erro em x": [f"{erro:.8e}"],
        "Nº de iterações": [iteracoes]
    }

    df_novo = pd.DataFrame(dados)

    if os.path.exists(nome_arquivo):
        df_existente = pd.read_excel(nome_arquivo)
        df_total = pd.concat([df_existente, df_novo], ignore_index=True)
    else:
        df_total = df_novo

    with pd.ExcelWriter(nome_arquivo, engine='openpyxl', mode='w') as writer:
        df_total.to_excel(writer, index=False)

def newton(f_str, x0, precisao):
    f_str = f_str.replace('^', '**')
    x = sp.symbols('x')
    f_expr = sp.sympify(f_str, locals={'e': sp.E})
    f_derivada = sp.diff(f_expr, x)
    f_lamb = sp.lambdify(x, f_expr, modules=["sympy"])
    f_deriv_lamb = sp.lambdify(x, f_derivada, modules=["sympy"])

    if abs(f_lamb(x0)) < precisao:
        alpha = x0
        return alpha, f_lamb(alpha), 0.0, 0

    k = 1
    while True:
        fx = f_lamb(x0)
        dfx = f_deriv_lamb(x0)
        if dfx == 0:
            raise ValueError("Derivada zero. Método de Newton falhou.")
        
        x1 = x0 - fx / dfx

        if abs(f_lamb(x1)) < precisao or abs(x1 - x0) < precisao:
            return x1, f_lamb(x1), abs(x1 - x0), k

        x0 = x1
        k += 1

funcao = input("Digite a função f(x): ")
x0 = float(input("Digite o valor inicial x0: "))
precisao = float(input("Digite a precisão ε: "))

try:
    raiz, fx_aprox, erro, iteracoes = newton(funcao, x0, precisao)
    print(f"Raiz aproximada: {raiz:.8f}")
    dados_iniciais = f"x0={x0}, ε={precisao}"
    salvar_resultado_excel("metodos.xlsx", "Newton", dados_iniciais, raiz, fx_aprox, erro, iteracoes)
except Exception as e:
    print(f"Erro: {e}")
