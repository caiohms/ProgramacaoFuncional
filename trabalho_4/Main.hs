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
ordB :: Char -> Char -> Int
ordB c d = ord c + ord d

-- 8e max

-- 8f max

-- 8g min

-- 8h min

-- 8i curry

-- 8j curry

-- 8k uncurry

-- 8l uncurry


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
    
    putStrLn $ "Func. 8c: entrada: \"a\"; resultado: " ++ show (ordA "a")
    putStrLn $ "Func. 8d: entrada: \"abc\"; resultado: " ++ show (ordB "a" "b")
    
    -- putStrLn $ "Func. 8e: entrada: ; resultado: " ++ show (flipA)
    -- putStrLn $ "Func. 8f: entrada: ; resultado: " ++ show (flipA)
    -- putStrLn $ "Func. 8g: entrada: ; resultado: " ++ show (flipA)
    -- putStrLn $ "Func. 8h: entrada: ; resultado: " ++ show (flipA)
    -- putStrLn $ "Func. 8i: entrada: ; resultado: " ++ show (flipA)
    -- putStrLn $ "Func. 8j: entrada: ; resultado: " ++ show (flipA)
    -- putStrLn $ "Func. 8k: entrada: ; resultado: " ++ show (flipA)
    -- putStrLn $ "Func. 8l: entrada: ; resultado: " ++ show (flipA)
