""" A empresa que você trabalha resolveu conceder um aumento salarial a todos funcionários, de acordo com a tabela abaixo:

============================================
| Salário |      Percentual de Reajuste     |
--------------------------------------------
|       0 - 600.00            |      17%    |
--------------------------------------------
|       600.01 - 900.00       |      13%    |
--------------------------------------------
|       900.01 - 1500.00      |      12%    |
--------------------------------------------
|       1500.01 - 2000.00     |      5%     |
--------------------------------------------

Leia o salário do funcionário e calcule e mostre o novo salário, bem como
 o valor de reajuste ganho e o índice reajustado, em percentual.

A entrada contém apenas um valor de ponto flutuante, que pode ser maior ou
 igual a zero, com duas casas decimais, conforme exemplos abaixo.

Exemplo 1
============================================
| Exemplo de Entrada | Exemplo de Saída     |
--------------------------------------------
|       1000     |    Novo salario: 1120,00 | 
|                |    Reajuste ganho: 120,00|
|                |    Em percentual: 12 %   |
|                                           |
--------------------------------------------|


Exemplo 2

============================================
| Exemplo de Entrada | Exemplo de Saída     |
--------------------------------------------
|       1000     |    Novo salario: 2200,00 | 
|                |    Reajuste ganho: 200,00|
|                |    Em percentual: 10 %   |
|                                           |
|-------------------------------------------|
 """

import os
os.system("cls")  # limpa tela

salario = int(input())


if(salario <= 600):
    reajuste = salario * 0.17
    novo_valor = + salario
    percentual = 17


elif(salario) >= 600.01 and (salario) <= 900:
    reajuste = salario * 0.13
    novo_valor = + salario
    percentual = 13


elif(salario) >= 900.01 and (salario) <= 1500:
    reajuste = salario * 0.12
    novo_valor = salario + reajuste
    percentual = 12


elif(salario) >= 1500.01 and (salario) <= 2000:
    reajuste = salario * 0.10
    novo_valor = salario + reajuste
    percentual = 10


else:
    novo_valor = salario + (salario * (5/100))
    reajuste = novo_valor - salario
    percentual = 5
print(f'Novo salario: {"{:.2f}".format(novo_valor)}\nReajuste ganho: {"{:.2f}".format(reajuste)}\nEm percentual: {percentual} %')
