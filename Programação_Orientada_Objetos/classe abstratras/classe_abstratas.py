from abc import ABC, abstractmethod, abstractproperty
import os
os.system("cls")


class ControloeRemoto(ABC):
    @abstractmethod
    def ligar(self):
        pass

    def desligar(self):
        pass

    @property
    @abstractproperty
    def marca(self):
        pass


class ControleTv(ControloeRemoto):
    def ligar(self):
        print("Ligando TV ...")
        print("Ligada! ...")

    def desligar(self):
        print("Desligando TV ...")
        print("Desliga!")

    def marca(self):
        return "Lg"      


class ControleArcondicionado(ControloeRemoto):
    def ligar(self):
        print("Ligando o Ar Condicionado...")
        print("Ligado!")

    def desligar(self):
        print("Desligando Ar Condicionado ...")
        print("Desligado!")

    @property
    def marca(self):
        return "Lg"           


controle = ControleTv()
controle.ligar()
controle.desligar()

controle = ControleArcondicionado()
controle.ligar()
controle.desligar()
print(controle.marca)
