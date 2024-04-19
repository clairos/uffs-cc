from re import findall as find


def unirEstados(automato, estados):
    final = {}
    def unir(estado):
        for e in estado:
            if e in final:
                final[e] = unirListas(final[e], estado[e])
            else:
                final.update({e: estado[e]})

    for estado in estados:
        unir(automato[estado])
    return final


def unirListas(l1, l2):
    return l1 + list(set(l2) - set(l1))


def unirAutomatos(afd, afndTemp):
    mapaNovosEstados = {x: x + len(afd) for x in range(len(afndTemp))}
    aux = []

    if '&' in afd[0].keys():
        afd[0]['&'].append(mapaNovosEstados[0])
    else:
        afd[0].update({'&': [mapaNovosEstados[0]]})
    
    for chave in afndTemp.keys():
        for ch in afndTemp[chave].keys():
            if ch == '*':
                continue
            aux = []
            for i in afndTemp[chave][ch]:
                aux.append(mapaNovosEstados[i])
            afndTemp[chave][ch] = aux
    
    for chave in afndTemp.keys():
        afd.update({mapaNovosEstados[chave] : afndTemp[chave]})


def exibirAutomatoDeterministico(afnd, alfabeto):
    alfabeto.sort()
    print('     {}'.format('-----'*len(alfabeto)))
    print('     |', end='')
    for i in alfabeto:
        print('  {:2}|'.format(i), end='')
    print('\n     {}'.format('-----'*len(alfabeto)))
    for i in afnd.keys():
        if '*' in afnd[i].keys():
            print('*', end='')
        else:
            print(' ', end='')
        print('{:3}:|'.format(i), end='')
        for j in alfabeto:
            if j in afnd[i].keys():
                print(' {:2} |'.format(afnd[i][j][0]), end='')
            else:
                print(' {:2} |'.format('-'), end='')
        print('')
    print('     {}'.format('-----'*len(alfabeto)))


def gerarAfndToken(afnd, token, alfabeto):
    if not afnd:
        afnd.update({len(afnd): {}})
    
    tokenInicial = True
    
    for tk in token:
        if tk not in alfabeto:
            alfabeto.append(tk)
        
        if tokenInicial:
            mapeado = afnd[0]

            if tk in mapeado.keys():
                mapeado[tk].append(len(afnd))
            else:
                mapeado.update({tk : [len(afnd)]})
            tokenInicial = False
        else:
            afnd.update({len(afnd) : {tk: [len(afnd) + 1]}})
    
    afnd.update({len(afnd) : {'*': [1]}})


def gerarAfndGramatica(afnd, gramatica, alfabeto):
    if not afnd:
        afnd.update({0: {}})
    
    afndTemporario = {}
    mapaRegras = {}
    
    for regra in gramatica:
        simbolos = find(r'(\w*<\w+>|\w+|&)', regra)
        
        if simbolos[0] in mapaRegras.keys():
            indiceRegra = mapaRegras[simbolos[0]]
        else:
            indiceRegra = len(afndTemporario)
            afndTemporario.update({indiceRegra : {}})
            mapaRegras.update({simbolos[0]: indiceRegra})

        for simbolo in simbolos[1:]:
            terminal = find(r'^\w+', simbolo)
            naoTerminal = find(r'<\w+>', simbolo)
            terminal = '&' if not terminal else terminal[0]

            if terminal not in alfabeto:
                alfabeto.append(terminal)

            if not naoTerminal:
                rg = afndTemporario[indiceRegra]

                if terminal in rg.keys():
                    rg[terminal].append(len(afndTemporario))
                else:
                    rg.update({terminal : [len(afndTemporario)]})

                afndTemporario.update({len(afndTemporario): {'*':[1]}})
            else:
                naoTerminal = naoTerminal[0]

                if naoTerminal in mapaRegras.keys():
                    rg = mapaRegras[naoTerminal]
                else:
                    rg = len(afndTemporario)
                    mapaRegras.update({naoTerminal: rg})
                    afndTemporario.update({rg: {}})
                
                mp = afndTemporario[indiceRegra]
                
                if terminal in mp.keys():
                    mp[terminal].append(rg)
                else:
                    mp.update({terminal: [rg]})

    unirAutomatos(afnd, afndTemporario)

def eliminarEpsilonTransicoes(afnd):
    epsilon = []

    for chave in afnd.keys():
        if '&' in afnd[chave]:
            epsilon.append(chave)

    def copiarRegras(regras, nRegra):
        if nRegra not in epsilon:
            return
        
        epsilon.remove(nRegra)
        
        for regra in regras['&']:
            chaves = afnd[regra].keys()
            
            if '&' in chaves:
                copiarRegras(afnd[regra], regra)
                regras['&'] = unirListas(regras['&'], afnd[regra]['&'])
        
        afnd[nRegra] = unirEstados(afnd, regras['&'] + [nRegra]) 

    epAux = epsilon.copy()
    
    for ep in epAux:
        copiarRegras(afnd[ep], ep)
    
    for ep in epAux:
        del afnd[ep]['&']


def determinizar(afnd):
    mpRgs = {}
    visitados = set()

    def determiniza(regra, nReg):
        if nReg in visitados: 
            return
        visitados.add(nReg) 
        chaves = list(regra.keys()) 

        for chave in chaves:
            if len(regra[chave]) > 1:
                regra[chave].sort()
                nRg = str(regra[chave])
                
                if nRg not in mpRgs.keys(): 
                    nEst = len(afnd)
                    mpRgs.update({nRg: nEst})
                    afnd.update({len(afnd): unirEstados(afnd, regra[chave])})
                    determiniza(afnd[nEst], nEst)
                
                regra.update({chave: [mpRgs[nRg]]})

    i, t = 0, len(afnd)
    while i < t:
        determiniza(afnd[i], i)
        i, t = i + 1, len(afnd)


def eliminarInalcancaveis(afnd):
    visitados = set()

    def elimina(regra, estado):
        if estado in visitados:
            return
        
        visitados.add(estado)
        
        for chave in regra.keys():
            if chave == '*':
                continue
            for i in regra[chave]:
                elimina(afnd[i], i)

    elimina(afnd[0], 0)
    x = len(afnd)

    for i in range(x):
        if i not in visitados:
            del afnd[i]


def eliminarInuteis(afnd):
    visitados = set()
    uteis = set()
    
    for rg in afnd:
        if '*' in afnd[rg].keys():
            uteis.add(rg)
    
    def elimina(regra, nRegra):
        if nRegra in uteis:
            return True
        
        visitados.add(nRegra)
        
        for chave in regra.keys():
            for rg in regra[chave]:
                if rg not in visitados:
                    if elimina(afnd[rg], rg):
                        return True
        return False

    aux = list(afnd.keys())
    
    for regra in aux:
        if elimina(afnd[regra], regra):
            uteis.add(regra)
        visitados = set()
    
    for regra in aux:
        if regra not in uteis:
            del afnd[regra]
    
    for regra in afnd.keys():
        aux = list(afnd[regra].keys())
        for chave in aux:
            if chave == '*':
                continue
            
            for rg in afnd[regra][chave]:
                if rg not in uteis:
                    del afnd[regra][chave]

#################################################################

def reconhecerStrings():
    with open("programa.txt", "r") as programa:
        linhas = programa.readlines()
        tokens_por_linha = []
        for num_linha, linha in enumerate(linhas, start=1):
            tokens = linha.strip().split()
            tokens_por_linha.append((num_linha, tokens))
            # print(tokens_por_linha)
    return tokens_por_linha

def verificarToken(afd, token, tabela_de_simbolos, num_linha):
    estado = 0

    for simbolo in token:
        if simbolo not in afd[estado]:
            tabela_de_simbolos.append((num_linha, token, "x"))
            return
        estado = afd[estado][simbolo][0] 

    if '*' in afd[estado]:
        tabela_de_simbolos.append((num_linha, token, estado)) 
        return 

    if 'Îµ' in afd[estado]:
        estado = afd[estado]["Îµ"][0] 
        if '*' in afd[estado]:
            tabela_de_simbolos.append((num_linha, token, estado))
            return

    tabela_de_simbolos.append((num_linha, token, "x"))


def fazerAnaliseLexica(afd):
    tokens_por_linha = reconhecerStrings()
    tabela_de_simbolos = []
    for num_linha, tokens in tokens_por_linha:
        for token in tokens:
            verificarToken(afd, token, tabela_de_simbolos, num_linha) 

    fita = gerarFita(tabela_de_simbolos)
    imprimirTabelaDeSimbolosEFita(tabela_de_simbolos, fita)

def imprimirTabelaDeSimbolos(tabelaDeSimbolos):
    print("Tabela de saída:")
    for item in tabelaDeSimbolos:
        print(item)

def gerarFita(tabelaDeSimbolos):
    fita = [item[2] for item in tabelaDeSimbolos]
    fita.append("$")
    return fita

def imprimirFita(fita):
    print("Fita:")
    print(fita)

def imprimirTabelaDeSimbolosEFita(tabela, fita):
    print("Tabela de saída:")
    for item in tabela:
        print(item)

    print(f"\nFita: {fita}")
