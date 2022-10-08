entrada = input().split()

distancia = int(entrada[0])
diametro1 = int(entrada[1])
diametro2 = int(entrada[2])


imc = distancia/(diametro1 + diametro2)
print('%.2f' % imc)