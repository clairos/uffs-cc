import csv
import statistics
import time
import os.path

from Search_Heuristics.Constructive.Criteria.VerticeMaisProximo import VerticeMaisProximo
from Search_Heuristics.Local.BuscaLocalMelhorMelhora import BuscaLocalMelhorMelhora
from Search_Heuristics.Local.BuscaLocalPrimeiraMelhora import BuscaLocalPrimeiraMelhora
from Search_Heuristics.Local.BuscaTabu import BuscaTabu
from Search_Heuristics.Local.Neighbourhood.SuaVizinhanca import SuaVizinhanca
from Search_Heuristics.Local.Neighbourhood.Vizinhanca2opt import Vizinhanca2opt
from Search_Heuristics.Local.Neighbourhood.VizinhancaShift import VizinhancaShift
from Search_Heuristics.Constructive.BuscaConstrutivaGulosoAlfa import BuscaConstrutivaGulosoAlfa


def ler_arquivo(instancia: str) -> tuple:
    with open('Search_Heuristics/Instances/' + instancia + '.csv', 'r') as arquivo:
        leitor = csv.reader(arquivo, quoting=csv.QUOTE_NONNUMERIC, delimiter=",")
        distancias = tuple(map(tuple, leitor))
        distancias = tuple(tuple(map(int, i)) for i in distancias)  # Converte valores para inteiros
        return distancias


def computar_metricas(resultados_amostras: list) -> tuple[int, float, int]:
    qualidades, tempos = zip(*resultados_amostras)
    qualidade_media, tempo_medio = sum(qualidades) / amostras, sum(tempos) / amostras
    qualidade_desvio = statistics.stdev(qualidades, qualidade_media)
    qualidade_media, qualidade_desvio, tempo_medio = round(qualidade_media, 2), round(qualidade_desvio, 2), round(tempo_medio, 2)
    return qualidade_media, qualidade_desvio, tempo_medio


def escrever_resultados(resultados: tuple) -> None:
    path = 'Search_Heuristics/Results/resultados.csv'
    cabecalho = ("instancia", "autoria", "algoritmo", "q-medio", "q-desvio", "t-medio", "% do ótimo")
    arquivo_existe = os.path.isfile(path)
    with open(path, 'a', encoding='UTF8', newline='') as csvf:
        writer = csv.writer(csvf, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
        if not arquivo_existe:
            writer.writerow(cabecalho)
        for i in resultados:
            writer.writerow(i)


def escrever_resultados_amostras(resultados: list) -> None:
    path = 'Search_Heuristics/Results/resultados_amostras.csv'
    cabecalho = ("instancia", "algoritmo", "Sample 1", "Sample 2", "Sample 3", "Sample 4", "Sample 5", "Sample 6", "Sample 7", "Sample 8", "Sample 9", "Sample 10")
    arquivo_existe = os.path.isfile(path)
    with open(path, 'a', encoding='UTF8', newline='') as csvf:
        writer = csv.writer(csvf, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
        if not arquivo_existe:
            writer.writerow(cabecalho)
        writer.writerow(resultados)


# Constantes/Parâmetros Fixos
#arquivos = ('wi29', 'dj38', 'qa194', 'uy734', 'zi929')
#tamanho_total = 29 + 38 + 194 + 734 + 929
arquivos = ('zi929',)
tamanho_total = 929
#instancias = ("Western Sahara", "Djibouti", "Qatar", "Uruguay", "Zimbabwe")
instancias = ("Zimbabwe",)
#solucoes_otimas = (27603, 6656, 9352, 79114, 95345)
solucoes_otimas = (95345,)
amostras = 10
tempo_total_maximo = 20 # em minutos
# Mudar para o seu nome ou sobrenome
autoria = "Beyoncé"


def main():
    for idx, arquivo in enumerate(arquivos):
        distancias = ler_arquivo(arquivo)
        tamanho = len(distancias)
        solucao_otima = solucoes_otimas[idx]
        algoritmos = (
            # Não é necessário executar as buscas construtivas para a atividade
            #BuscaConstrutivaGulosoAlfa(VerticeMaisProximo(distancias), solucao_otima, 0),
            BuscaConstrutivaGulosoAlfa(VerticeMaisProximo(distancias), solucao_otima, 0.11),
            #BuscaConstrutivaGulosoAlfa(VerticeMaisProximo(distancias), solucao_otima, 0.2),
            #BuscaConstrutivaGulosoAlfa(VerticeMaisProximo(distancias), solucao_otima, 0.3),
            #BuscaLocalMelhorMelhora(Vizinhanca2opt(distancias), solucao_otima),
            #BuscaLocalMelhorMelhora(VizinhancaShift(distancias), solucao_otima),
            #BuscaLocalMelhorMelhora(SuaVizinhanca(distancias), solucao_otima),  # Mudar nome para a Vizinhanca implementada
            #BuscaLocalPrimeiraMelhora(Vizinhanca2opt(distancias), solucao_otima),
            BuscaLocalPrimeiraMelhora(VizinhancaShift(distancias), solucao_otima),
            #BuscaLocalPrimeiraMelhora(SuaVizinhanca(distancias), solucao_otima),  # Mudar nome para a Vizinhanca implementada
            #BuscaTabu(Vizinhanca2opt(distancias), solucao_otima, 3),
            #BuscaTabu(VizinhancaShift(distancias), solucao_otima, 3),
            # BuscaTabu(SuaVizinhanca(distancias), solucao_otima, 3),  # Mudar nome para a Vizinhanca implementada
            #BuscaTabu(Vizinhanca2opt(distancias), solucao_otima, 5),
            #BuscaTabu(VizinhancaShift(distancias), solucao_otima, 5),
            # BuscaTabu(SuaVizinhanca(distancias), solucao_otima, 5),  # Mudar nome para a Vizinhanca implementada
            )
        # tempo limite de execução, em segundos, para a instância específica
        tempo_limite = tamanho * tempo_total_maximo * 60 / amostras / tamanho_total / len(algoritmos)
        print("Instância:", instancias[idx])
        for algoritmo_busca in algoritmos:
            print("Algoritmo:", algoritmo_busca.nome)
            resultados = []
            resultados_amostras = [instancias[idx], algoritmo_busca.nome]
            for am in range(amostras):
                print("Executando amostra:", am + 1)
                # Início da busca heurística
                tempo_inicial = time.time()
                algoritmo_busca.tempo_limite = tempo_limite + tempo_inicial
                solucao_list = algoritmo_busca.buscar_solucao()

                # Trecho usado para salvar no padrão das atividades
                melhor_qualidade = solucao_list[-1].qualidade
                tempo_execucao = time.time() - tempo_inicial
                resultados.append((melhor_qualidade, tempo_execucao))
                # Trecho usado para salvar amostras independentes
                resultados_amostras.append(melhor_qualidade)

            qualidade_media, qualidade_desvio, tempo_medio = computar_metricas(resultados)
            percentual_otimo = round(qualidade_media * 100 / solucao_otima, 2)
            escrever_resultados(((instancias[idx], autoria, algoritmo_busca.nome, qualidade_media, qualidade_desvio, tempo_medio, percentual_otimo), ))

            # Trecho usado para salvar amostras independentes
            escrever_resultados_amostras(resultados_amostras)


# Rotina de Execução
main()
