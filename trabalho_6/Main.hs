-- Caio Henrique Martins dos Santos
-- Trabalho 6
-- Programação funcional
-- Frank Coelho de Alcântara
-- Outubro/2022

-- 1. Usando List Comprehension escreva uma função, chamada divisoresden, que devolva uma lista dos divisores de um número dado.
divisoresden :: Int -> [Int]
divisoresden x = [n | n <- [1..x], mod x n == 0]

-- 2. Usando  List Comprehension  escreva  uma  função,  chamada  contaCaractere,  que  conte  a ocorrência de um caractere específico, em uma string dada.
contaCaractere :: String -> Char -> Int
contaCaractere str c = length [x | x <- str, x == c]

-- 3. Usando List Comprehension escreva uma função, chamada dobroNaoNegativo, que devolve o dobro dos valores dos elementos não negativos da lista de inteiros dada. 
dobroNaoNegativo :: [Int] -> [Int]
dobroNaoNegativo list = [x * 2 | x <- list, x >= 0] 

-- 4. Usando List Comprehension escreva uma função, chamada pitagoras, que devolva uma lista de triplas, não repetidas, contendo os lados dos triângulos retângulos possíveis de serem construídos por inteiros entre 1 e um número inteiro dado. 
pitagoras :: Int -> [(Int,Int,Int)]
pitagoras n = [(a,b,c) | a <-[1..n], b <-[1..n], c <- [1..n], ((a^2) + (b^2)) == (c^2), c > a, c > b, b > a]

-- 5. Números  perfeitos  são  aqueles  cuja  soma  dos  seus  divisores  é  igual  ao  próprio  número. Usando List Comprehension escreva uma função, chamada numerosPerfeitos, que devolva uma lista contendo todos os números perfeitos menores que um número dado. Lembre-se que você já tem uma função que devolve uma lista dos divisores de um número dado. 
numerosPerfeitos :: Int -> [Int]
numerosPerfeitos n = [x | x <- [1..n], sum (init (divisoresden x)) == x]

-- 6. Usando List Comprehension escreva uma função, chamada produtoEscalar, que devolva o produto escalar entre duas listas de inteiros. Lembre-se, existem as funções fst, snd e zip no prelude que podem ser úteis. 
produtoEscalar :: [Int] -> [Int] -> Int
produtoEscalar l1 l2 = (sum [x*y | (x, y) <- zip l1 l2])

-- 7. Usando  List Comprehension  escreva  uma  função,  chamada  primeirosPrimos,  que  devolva uma lista contendo os n primeiros números primos a partir do número 2. 
primeirosPrimos :: Int -> [Int]
primeirosPrimos n = [x | x <- [2..n], length (divisoresden x) == 2]

-- 8. Usando  List Comprehension  escreva  uma  função,  chamada  paresOrdenados,  que  devolva uma  lista  de  par  ordenados  contendo  uma  potência  de  2  e  uma  potência  de  3  até  um determinado número dado. Observe que estes números podem ser bem grandes. 
paresOrdenados :: Int -> [(Int,Int)]
paresOrdenados n = [(2^x,3^x) | x <- [1..n]]


main = do

    putStrLn $ "Func 1. Entrada: 50; Resultado:" ++ show (divisoresden 50)

    putStrLn $ "Func 2. Entrada: \"teste\" 'e'; Resultado:" ++ show (contaCaractere "teste" 'e')

    putStrLn $ "Func 3. Entrada: [0,1,-2,3,-4,5]; Resultado:" ++ show (dobroNaoNegativo [0,1,-2,3,-4,5])

    putStrLn $ "Func 4. Entrada: 15; Resultado:" ++ show (pitagoras 15)

    putStrLn $ "Func 5. Entrada: 1000; Resultado:" ++ show (numerosPerfeitos 1000)

    putStrLn $ "Func 6. Entrada: [0,1,2,3,4] [10,0,20,30,100]; Resultado:" ++ show (produtoEscalar [0,1,2,3,4] [10,0,20,30,100])

    putStrLn $ "Func 7. Entrada: 50; Resultado:" ++ show (primeirosPrimos 50)

    putStrLn $ "Func 8. Entrada: 5; Resultado:" ++ show (paresOrdenados 5)
    
