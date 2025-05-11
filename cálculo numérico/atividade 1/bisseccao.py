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

def bisseccao(f, a, b, precisao):
    if f(a) * f(b) >= 0:
        raise ValueError("f(a) e f(b) devem ter sinais opostos.")

    if b - a < precisao:
        x_aprox = (a + b) / 2
        return x_aprox, f(x_aprox), 0.0, 0

    k = 1
    M = f(a)

    while True:
        x = (a + b) / 2
        if M * f(x) > 0:
            a = x
        else:
            b = x

        erro = abs(b - a)

        if erro < precisao:
            x_aprox = (a + b) / 2
            return x_aprox, f(x_aprox), erro, k

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
    contexto = {**contexto_base, "x": x}
    return eval(funcao, contexto)

try:
    x_aprox, fx_aprox, erro, iteracoes = bisseccao(f, a, b, precisao)
    print(f"Raiz aproximada: {x_aprox:.8f}")

    dados_iniciais = f"a={a}, b={b}, ε={precisao}"
    salvar_resultado_csv("metodos.csv", "Bissecção", dados_iniciais, x_aprox, fx_aprox, erro, iteracoes)

except Exception as e:
    print(f"Erro: {e}")
