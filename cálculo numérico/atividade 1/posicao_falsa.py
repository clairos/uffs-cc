import math
import pandas as pd
import re
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

def posicao_falsa(f, a, b, precisao):
    if f(a) * f(b) >= 0:
        raise ValueError("f(a) e f(b) devem ter sinais opostos.")
    
    if b - a < precisao:
        x_aprox = (a + b) / 2
        return x_aprox, f(x_aprox), 0.0, 0

    if abs(f(a)) < precisao:
        return a, f(a), 0.0, 0

    if abs(f(b)) < precisao:
        return b, f(b), 0.0, 0
    
    k = 1
    M = f(a)

    while True:
        x = ((a * f(b)) - (b * f(a))) / (f(b) - f(a))

        if abs(f(a)) < precisao:
            return x, f(x), 0.0, k
        
        if abs(M * f(x)) > 0:
            a = x
        else:
            b = x

        erro = abs(b - a)

        if erro < precisao:
            return (a + b) / 2, f((a + b) / 2), erro, k
        
        k += 1

funcao = input("Digite a função f(x): ")
funcao = funcao.replace('^', '**').replace('ln', 'log')
funcao = re.sub(r'e\^\(([^)]+)\)', r'exp(\1)', funcao)
funcao = re.sub(r'e\^([^\s\+\-\*/\^]+)', r'exp(\1)', funcao)

a = float(input("Digite o valor de a: "))
b = float(input("Digite o valor de b: "))
precisao = float(input("Digite a precisão ε: "))

math_funcs = {q: getattr(math, q) for q in dir(math) if not q.startswith("__")}
contexto_base = {**math_funcs, "e": math.e, "pi": math.pi}

def f(x):
    return eval(funcao, {**contexto_base, "x": x})

try:
    raiz, fx_aprox, erro, iteracoes = posicao_falsa(f, a, b, precisao)
    print(f"Raiz aproximada: {raiz:.8f}")

    dados_iniciais = f"a={a}, b={b}, ε={precisao}"
    salvar_resultado_excel("metodos.xlsx", "Posição Falsa", dados_iniciais, raiz, fx_aprox, erro, iteracoes)

except Exception as e:
    print(f"Erro: {e}")
