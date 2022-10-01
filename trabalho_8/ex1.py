# Caio Henrique Martins dos Santos
# 30/09/2022
# Programação funcional
# Prof. Frank Coelho de Alcantara

# 1. Usando  os  conceitos  de  programação  funcional  e  considerando  o  universo  dos  números inteiros,  
# implemente  a  função  foldr  em  Python,  C  ou  C++  20  tomando  como  base  o funcionamento  desta  função
# em  Haskell.  Sem,  é  claro,  usar  qualquer  função,  objeto,  ou biblioteca disponíveis na linguagem que você escolher.


def foldr(fun, init, arg: list):
    if (len(arg) == 0):
        return init

    last = arg[-1]
    arg.pop(-1)

    return fun(foldr(fun, init, arg), last)


def somar(val1, val2):
    return val1 + val2


# teste
print(foldr(somar, 5, [1, 2, 3, 4]))
