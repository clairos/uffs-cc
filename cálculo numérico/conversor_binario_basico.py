def decimal_para_binario(numero_decimal, precisao=10):
    if numero_decimal < 0:
        return '-' + decimal_para_binario(-numero_decimal, precisao)
    
    parte_inteira = int(numero_decimal)
    parte_fracionaria = numero_decimal - parte_inteira

    binario_inteiro = bin(parte_inteira)[2:]

    binario_fracionario = ''
    count = 0
    while parte_fracionaria > 0 and count < precisao:
        parte_fracionaria *= 2
        bit = int(parte_fracionaria)
        binario_fracionario += str(bit)
        parte_fracionaria -= bit
        count += 1

    if binario_fracionario:
        return f'{binario_inteiro}.{binario_fracionario}'
    else:
        return binario_inteiro

# Solicita entrada do usuário
entrada = input("Digite um número decimal (use ponto para separar a parte fracionária, ex: 10.625): ")

try:
    numero = float(entrada)
    resultado = decimal_para_binario(numero)
    print(f"Número binário: {resultado}")
except ValueError:
    print("Entrada inválida. Certifique-se de digitar um número decimal válido.")
