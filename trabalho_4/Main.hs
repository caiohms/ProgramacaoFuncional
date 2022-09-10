import Data.Char

-- Caio Henrique Martins dos Santos
-- Programacao funcional
-- Trabalho 4
-- 01/set/2022

{- 1. Escreva  uma  função  chamada  fatorialn  que  usando  o  operador  range  e  a  função  foldr devolva o fatorial de n.  -}
fatorialn :: Int -> Int
fatorialn n = foldr (*) 1 [1..n]

{- 2. Usando a função map escreva uma função, chamada quadradoReal que recebe uma lista de números reais, positivos e negativos e devolva uma lista com o quadrado de cada um dos reais listados.  -}
quadradoReal :: [Double] -> [Double]
quadradoReal x = map (**2) x

{- 3. Usando a função map escreva uma função, comprimentoPalavras que recebe uma lista de palavras e devolve uma lista com o comprimento de cada uma destas palavras.  -}
comprimentoPalavras :: [[Char]] -> [Int]
comprimentoPalavras p = map length p

{- 4. Usando a função filter escreva uma função, chamada maiorMultiploDe29 devolva o maior número entre 0 e 100000 que seja divisivel por 29. -}
maiorMultiploDe29 :: Int
maiorMultiploDe29 = last (filter (\x -> mod x 29 == 0) [0..100000])

{- 5. Usando  a  função  filter  escreva  uma  função,  chamada  maiorMultiploDe que  recebe  um inteiro e devolva o maior número entre 0 e 100000 que seja divisivel por este inteiro.  -}
maiorMultiploDe :: Int -> Int
maiorMultiploDe n = last (filter (\x -> mod x n == 0) [0..100000])

{- 6. Usando Haskell e a função foldr defina uma função, chamada somaQuadrados que devolva a soma dos quadrados dos itens de uma lista de números naturais de comprimento n. De tal forma que: 𝑠𝑜𝑚𝑎𝑄𝑢𝑎𝑑𝑟𝑎𝑑𝑜𝑠=12 +22 +32 +42...+𝑛2.  -}
somaQuadrados :: [Int] -> Int
somaQuadrados l = foldr (\x y -> x^2 + y) 0 l

{- 7. Usando Haskell e a função foldl defina uma função, chamada comprimento, que devolva o comprimento (cardinalidade) de uma lista dada.   -}
comprimento :: [a] -> Int
comprimento l = foldl (\x y -> x+1) 0 l

{- 8. Esta é uma tarefa de pesquisa: você deve encontrar e executar exemplos em Haskell do uso das seguintes funções disponíveis no Prelude: flip, ord, max, min, curry, uncurry. Para cada uma destas funções você deverá encontrar, executar e testar no mínimo dois exemplos. -}

-- 8a flip
flipA :: Int -> Int -> Int
flipA x y = flip (-) x y

-- 8b flip
flipB :: Double -> Double -> Double
flipB x y = flip (/) x y

-- 8c ord
ordA :: Char -> Int
ordA c = ord c

-- 8d ord
ordB :: [Char] -> Int
ordB s = foldr (+) 0 (map ord s)

-- 8e max
maxA :: Int -> Int -> Int
maxA x y = max x y

-- 8f max
maxB :: Int -> Int -> Int -> Int
maxB x y z = max (max x y) z

-- 8g min
minA :: Int -> Int -> Int
minA x y = min x y

-- 8h min
minB :: [(Int, Int)] -> [Int]
minB l = map (\(x,y) -> min x y) l

-- 8i curry
curryA :: ((Int,Int) -> Int) -> Int -> Int -> Int
curryA f x y = curry f x y

-- 8j curry
curryB :: Int -> Int -> Int
curryB x y = curry (\(x,y) -> x - y) x y

-- 8k uncurry
uncurryA :: (Int -> Int -> Int) -> ((Int,Int) -> Int)
uncurryA f = uncurry (f)

-- 8l uncurry
uncurryB :: (Int, Int) -> Int
uncurryB (x,y) = uncurry (\x y -> x - y) (x,y)

main = do
    putStrLn $ "Func. 1: entrada: 5; resultado: " ++ show (fatorialn 5)
    putStrLn $ "Func. 2: entrada: [-2,-1,0,1,2]; resultado: " ++ show (quadradoReal [-2,-1,0,1,2])
    putStrLn $ "Func. 3: entrada: [\"Nem\", \"só\", \"de\", \"Fibonacci\", \"vivem\", \"os\", \"exemplos\", \"de\", \"recursão\"]; resultado: " ++ show (comprimentoPalavras ["Nem", "só", "de", "Fibonacci", "vivem", "os", "exemplos", "de", "recursão"])
    putStrLn $ "Func. 4: entrada: ; resultado: " ++ show (maiorMultiploDe29)
    putStrLn $ "Func. 5: entrada: 99; resultado: " ++ show (maiorMultiploDe 99)
    putStrLn $ "Func. 6: entrada: [1,2,3,4]; resultado: " ++ show (somaQuadrados [1,2,3,4])
    putStrLn $ "Func. 7: entrada: [1,2,3,4]; resultado: " ++ show (comprimento [1,2,3,4])

    putStrLn $ "Func. 8a: entrada: 10 20; resultado: " ++ show (flipA 10 20)
    putStrLn $ "Func. 8b: entrada: 10 20; resultado: " ++ show (flipB 10 20)
    
    putStrLn $ "Func. 8c: entrada: \'a\'; resultado: " ++ show (ordA 'a')
    putStrLn $ "Func. 8d: entrada: \"abc\"; resultado: " ++ show (ordB "abc")
    
    putStrLn $ "Func. 8e: entrada: 10 20; resultado: " ++ show (maxA 10 20)
    putStrLn $ "Func. 8f: entrada: 10 20 30; resultado: " ++ show (maxB 10 20 30)

    putStrLn $ "Func. 8g: entrada: 10 20; resultado: " ++ show (minA 10 20)
    putStrLn $ "Func. 8h: entrada: [(1,2),(3,-4),(0,1)]; resultado: " ++ show (minB [(1,2),(3,-4),(0,1)])

    putStrLn $ "Func. 8i: entrada: (\\(x,y) -> x + y) 10 20; resultado: " ++ show (curryA (\(x,y) -> x + y) 10 20)
    putStrLn $ "Func. 8j: entrada: 10 20; resultado: " ++ show (curryB 10 20)

    putStrLn $ "Func. 8k: entrada: (\\x y -> x + y) (12, 13); resultado: " ++ show (uncurryA (\x y -> x + y) (12, 13))
    putStrLn $ "Func. 8l: entrada: (10,20); resultado: " ++ show (uncurryB (10,20))
