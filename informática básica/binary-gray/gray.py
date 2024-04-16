n=int(input(" insira um número de 0 a 15: "))
binarioN=[]
aux=n

while(aux!=0):
    bit=(aux%2)
    aux=aux//2
    binarioN.append(bit)

while(len(binarioN)<4):
    binarioN.append(0)
binarioN.reverse()

print(" binário normal:", binarioN)

binarioGreyN=[]
binarioGreyN.append(binarioN[0])

for i in range(len(binarioN)-1):
    if(binarioN[i]==binarioN[i+1]):
        binarioGreyN.append(0)
    else:
        binarioGreyN.append(1)

print(" binário grey: ", binarioGreyN)