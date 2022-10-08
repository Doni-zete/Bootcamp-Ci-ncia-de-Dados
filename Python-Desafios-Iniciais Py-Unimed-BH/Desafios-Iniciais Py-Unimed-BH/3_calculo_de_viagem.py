valores = input().split()

tempo_gasto = int(valores[0])
velocidade_media = int(valores[1])

faz_litro = 12
litro = tempo_gasto * velocidade_media
total = litro/faz_litro
print("%.3f" % total)
