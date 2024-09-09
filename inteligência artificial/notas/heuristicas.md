# Buscas Informadas
## Heurísticas

Utiliza conhecimento sobre o domínio do problema para fazer a busca de forma mais eficiente

- Chamamos a função h(n) de *função heurística*
- Ela é considerada **admissível** quando nunca passa do custo necessário desde o estado avaliado até o estado meta.
> Uma heurística admissível é sempre considerada otimista.

---

#### Busca Gulosa
##### GS - Greed Search


&rarr; Expande o nó que tem o h(n) menor 
&rarr; É completa *(se a quantidade de estados for finito)*
&rarr; Otimalidade e complexidade de tempo e espaço depende do problema e da heurística

#### Busca A*
##### A estrela

&rarr; Expande o nó que tem o h(n) + g(n) menor
> Se empatar, escolhe o resultado aleatoriamente

&rarr; 
&rarr; É completa *(se a quantidade de estados for finito)*
&rarr; É ótima *(se h(n) for **admissível**)*
&rarr; A complexidade assintótica de tempo e espaço é 0(b^d)
