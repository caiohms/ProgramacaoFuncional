-- Caio Henrique Martins dos Santos
-- Programacao funcional
-- Trabalho 3
-- 26/ago/2022

{- 1. Escreva uma função para o cálculo dos números da sequência de Fibonacci, utilizando Haskell. -}
fib :: Int -> [Int]
fib 0 = [0]
fib 1 = [0,1]
fib n = fib 1 ++ [ last(fib(x-1)) + last(fib(x-2)) | x  <- [2..n] ]

{- 2. Um dos primeiros algoritmos documentados é o algoritmo para o cálculo do Maior Divisor
Comum (MDC) de Euclides publicado por volta do ano 300 AC. Podemos simplificar este
algoritmo dizendo que dados dois inteiros A e B, o MDC entre eles será dado pelo valor
absoluto de A se B=0 e pelo MDC entre B e o resto da divisão de A por B se B>0. Escreva
uma função para o cálculo do MDC entre dois números inteiros positivos, usando o
algoritmo de Euclides conforme apresentado aqui, utilizando Haskell. -}
mdc :: Int -> Int -> Int
mdc a b = 
    if b == 0 then abs a
    else mdc b (mod a b)

{- 3. Escreva uma função recursiva que dado um número inteiro n, devolva a soma dos dígitos
deste número. Exemplo: dado 1234 a função deverá devolver 10. Utilizando Haskell e
recursividade. -}
somaDigitos :: Int -> Int
somaDigitos 0 = 0
somaDigitos n = mod n 10 + somaDigitos(div n 10)

{- 4. Escreva uma função que devolva a soma de todos os números menores que 10000 que
sejam múltiplos de 3 ou 5. -}
somaMultiplos :: Int -> Int
somaMultiplos 0 = 0
somaMultiplos n =
    if(mod n 3 == 0 || mod n 5 == 0) then n + somaMultiplos(n-1)
    else somaMultiplos(n-1)

{- 5. Escreva uma função que, recebendo uma lista de inteiros, apresente a diferença entre a
soma dos quadrados e o quadrado da soma destes inteiros, usando recursividade. -}
diferenca :: [Int] -> Int
diferenca l = diferenca_aux(l) - ((sum l) ^ 2)

diferenca_aux :: [Int] -> Int
diferenca_aux [] = 0
diferenca_aux (x:xs) = (x ^ 2) + diferenca_aux(xs)

{- 6. O Crivo de Eratóstenes não é o melhor algoritmo para encontrar números primos. Crie uma
função que implemente o Crivo de Euler (Euler’s Sieve) para encontrar todos os números
primos menores que um determinado inteiro dado. -}
crivo :: Int -> [Int]
crivo x = crivo_aux([2..x])

crivo_aux :: [Int] -> [Int]
crivo_aux [] = []
crivo_aux (x:xs) = x : crivo_aux (crivo_remove x xs)

crivo_remove :: Int -> [Int] -> [Int]
crivo_remove x [] = []
crivo_remove x (y:ys) =
    if mod y x == 0 then crivo_remove x ys
    else y : crivo_remove x ys

{- 7. Nem só de Fibonacci vivem os exemplos de recursão. Escreva uma função que devolva
todos os números de uma sequência de Lucas (2, 1, 3, 4, 7, 11, 18, 29, 47, 76, 123) menores
que um inteiro dado. -}
lucas :: Int -> [Int]
lucas n = actual_lucas(lucas_aux_max_n 0 n)

actual_lucas :: Int -> [Int]
actual_lucas 0 = [2]
actual_lucas 1 = [2,1]
actual_lucas n = actual_lucas 1 ++ [ last(actual_lucas(x-1)) + last(actual_lucas(x-2)) | x <- [2..n] ]

lucas_aux_max_n :: Int -> Int -> Int
lucas_aux_max_n iterCount maxValue = 
    if last (actual_lucas (iterCount)) > maxValue then iterCount - 1
    else lucas_aux_max_n (iterCount + 1) maxValue

{- 8. Escreva uma função, chamada aoContrario em Haskel para reverter uma lista. Dado [1,2,3]
devolva [3,2,1]. -}
aoContrario :: [a] -> [a]
aoContrario [] = []
aoContrario list = last list : aoContrario(init list)

{- 9. Escreva uma função chamada somaRecursiva que recebe dois valores inteiros e devolve o
produto destes valores sem usar o operador de multiplicação. -}
somaRecursiva :: Int -> Int -> Int
somaRecursiva 0 _ = 0
somaRecursiva x y = y + somaRecursiva (x-1) y

{- 10. Escreva uma função chamada comprimento que receba uma lista de inteiros e devolva o
comprimento desta lista. Observe que você não pode usar nenhuma função que já calcule
o comprimento de uma lista. -}
comprimento :: [Int] -> Int
comprimento list = comprimento_aux 0 list

comprimento_aux :: Int -> [Int] -> Int
comprimento_aux len [] = len
comprimento_aux len (x:xs) =
    comprimento_aux (len+1) xs


main = do
    putStrLn $ "Func. 1: entrada: 8; resultado: " ++ show (fib 8)
    putStrLn $ "Func. 2: entrada: 12 9; resultado: " ++ show (mdc 12 9)
    putStrLn $ "Func. 3: entrada: 1234; resultado: " ++ show (somaDigitos 1234)
    putStrLn $ "Func. 4: entrada: 10000; resultado: " ++ show (somaMultiplos 10000)
    putStrLn $ "Func. 5: entrada: [1,2,3,4,5]; resultado: " ++ show (diferenca [1,2,3,4,5])
    putStrLn $ "Func. 6: entrada: 100; resultado: " ++ show (crivo 100)
    putStrLn $ "Func. 7: entrada: 124; resultado: " ++ show (lucas 124)
    putStrLn $ "Func. 8: entrada: [1,2,3,4,5]; resultado: " ++ show (aoContrario [1,2,3,4,5])
    putStrLn $ "Func. 9: entrada: 5 10; resultado: " ++ show (somaRecursiva 5 10)
    putStrLn $ "Func. 10: entrada: [3,2,41,512,445]; resultado: " ++ show (comprimento [3,2,41,512,445])
