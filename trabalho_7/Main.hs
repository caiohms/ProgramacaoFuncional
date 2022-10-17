-- Caio Henrique Martins dos Santos
-- Trabalho 7
-- Programação funcional
-- Frank Coelho de Alcântara
-- Setembro/2022

import Data.Char
import Data.Maybe

{--
1. Utilizando a linguagem Haskell e o seu próprio tipo de dados, crie um programa capaz de classificar triângulos a partir do comprimento dos seus lados sabendo que o comprimento de cada um dos lados deve ser maior que zero e que:  
a. triângulos equiláteros têm todos os lados do mesmo tamanho; 
b. triangulos esosceles têm, no mínimo, dois lados do mesmo tamanho;  
c. triangulos escalenos têm tem todos os lados de tamanho diferentes; 
d. triangulos degenerados têm um lado igual a soma dos outros dois e área zero.
--}

data Triangulo = Triangulo {
  a :: Double, 
  b :: Double,
  c :: Double
} deriving (Show) 

classificarTriangulo :: Triangulo -> String
classificarTriangulo t
  | a t < 0 || b t < 0 || c t < 0 = "Triangulo invalido"
  | a t == b t && a t + b t == c t || a t == c t && a t + c t == b t || b t == c t && b t + c t == a t = "Triangulo degenerado" 
  | a t == b t && a t == c t = "Triangulo equilatero"
  | a t == b t || a t == c t || b t == c t = "Triangulo isosceles"
  | a t /= b t && a t /= c t && b t /= c t = "Triangulo escaleno" 
  | otherwise = "Triangulo não reconhecido"


{-
2. Usando Haskell, crie uma função chamada fatias, com a assinatura dada por fatias:: :: Int -> String -> [[Int]] que receba um string e um inteiro e devolva uma lista de listas contendo em cada  item  uma  lista  de  inteiros.  Esta  função  receberá  strings  contendo  digitos  como,  por exemplo:  "345234678"  e  devolverá  listas  parecidas  com [[3,4,5],[4,5,2],[5,2,3],[2,3,4],[3,4,6],[4,6,7],[6,7,8]] No caso do exemplo, o inteiro que fatias recebeu foi 3. Observe que você poderá criar, quantas funções de apoio acredite que sejam necessárias  para  criar  as  funcionalidades  de  fatias  inclusive,  se  achar  interessante,  pode usar as funções mapMaybe e digitToInt.
-}

fatias :: Int -> String -> [[Int]]
fatias _ [] = []
fatias x (s:str) = 
    if length(s:str) >= x then [parseSubstring (take x string)] ++ fatias x str 
    else [] 
    where string = s:str

parseSubstring :: String -> [Int]
parseSubstring [] = []
parseSubstring (s:str) =
    if str == [] then [digitToInt s]
    else [digitToInt s] ++ parseSubstring str


{-
3. Usando  Haskell  escreva  uma  função  chamada  romanos  que  receba  um  inteiro  menor ou igual a 3000 e devolva um string deste inteiro representado com algarismos romanos.  
-}

lookupRoman :: Int -> Int -> String
lookupRoman d p
    | (p == 0) = fromJust $ lookup d [(5,"V"),(1,"I")]
    | (p == 1) = fromJust $ lookup d [(5,"L"),(1,"X")]
    | (p == 2) = fromJust $ lookup d [(5,"D"),(1,"C")]
    | (p == 3) = fromJust $ lookup d [(1,"M")]

parseRoman :: Int -> String
parseRoman n
    | (n == 0) = ""
    | (digit == 1 || digit == 5) = lookupRoman digit pwten
    | (digit <= 3) = lookupRoman 1 pwten ++ (parseRoman ((digit-1) * (10 ^ pwten)))
    | (digit == 4) = lookupRoman 1 pwten ++ lookupRoman 5 pwten
    | (digit <= 8) = (parseRoman ((digit-1) * (10 ^ pwten))) ++ lookupRoman 1 pwten
    | (digit == 9) = lookupRoman 1 pwten ++ lookupRoman 1 (pwten + 1)
    where pwten = floor (logBase 10 ((fromIntegral n) :: Float))
          digit = div n (10 ^ pwten)
    
romanos :: Int -> String
romanos 0 = ""
romanos n = 
    parseRoman ((div n 1000) * 1000) ++
    parseRoman ((mod (div n 100) 10) * 100) ++
    parseRoman ((mod (div n 10) 10) * 10) ++ 
    parseRoman (mod n 10)


{--
4. Usando linguagem  Haskell, escreva uma função que recebe uma lista de listas de inteiros com  até  5  digitos  em  cada  lista  e  devolva  apenas  as  listas  que  contenham  palíndromes primos.  Por  exemplo  na lista  de  listas  [[1,1,1],  [1,2,2],  [3,1,3],  [3,1,5]]  apenas  o  elemento [3,1,3] é um palíndrome  primo. Uma ferramenta importante para criar suas listas de teste pode ser encontrada em: Prime Number Calculator (calculatorsoup.com).
--}
inverterLista :: [Int] -> [Int]
inverterLista (x:xs) = 
    if xs == [] then [x]
    else inverterLista xs ++ [x]

isPrimo :: Int -> Int -> Bool
isPrimo x y =
    if y == 1 then True
    else if x `mod` y == 0 then False
    else isPrimo x (y-1)

juntar = foldl addicionarDigito 0
    where addicionarDigito num d = 10*num + d

palindromosPrimos :: [[Int]] -> [[Int]]
palindromosPrimos (x:xs) =
    if x == inverterLista x && isPrimo digito (digito-1) then if xs == [] then [x] else [x] ++ palindromosPrimos xs
    else if xs == [] then []
    else palindromosPrimos xs
    where digito = juntar x


{--
5. Usando a linguagem Haskell escreva uma função, chamada ultimoNome que receba o nome completo de uma pessoa e devolva apenas o último sobrenome sem qualquer vogal. Caso o  ultimo  sobrenome  não  contenhuma  nenhuma  vogal  devolva  o  ultimo sobrenome  que ainda contenha vogal. Por exemplo se o nome for Ana Maria stzrx, a função deve devolver Maria, se o nome for Silvia Silva a função deve devolver Slv.
--}
inverteString :: String -> String
inverteString (x:xs) =
    if xs == [] then [x]
    else inverteString xs ++ [x]

containsVogal :: [Char] -> Bool
containsVogal (x:xs) =
  if x == 'a' || x == 'A' || x == 'e' || x == 'E' || x == 'i' || x == 'I' || x == 'o' || x == 'O' || x == 'u' || x == 'U' then True
  else if xs == [] then False
  else containsVogal xs

numeroNomes :: String -> Int -> Int
numeroNomes (x:xs) y =
  if x == ' ' then numeroNomes xs (y+1)
  else if xs == [] then y+1
  else numeroNomes xs y

getUltimoNome :: String -> String
getUltimoNome (x:xs) =
  if numeroNomes (x:xs) 0 == 1 then (x:xs)
  else getUltimoNome xs

removePrimeiroNome :: String -> String
removePrimeiroNome (x:xs) =
  if x == ' ' then xs
  else if xs == [] then ""
  else removePrimeiroNome xs

removeVogais :: String -> String
removeVogais (x:xs) =
  if x == 'a' || x == 'A' || x == 'e' || x == 'E' || x == 'i' || x == 'I' || x == 'o' || x == 'O' || x == 'u' || x == 'U' then if xs == [] then "" else removeVogais xs
  else if xs == [] then ""
  else [x] ++ removeVogais xs

ultimoNome :: String -> String
ultimoNome (x:xs) =
  if getUltimoNome (x:xs) == "" then ""
  else if containsVogal (getUltimoNome (x:xs)) then removeVogais (getUltimoNome (x:xs))
  else ultimoNome (inverteString (removePrimeiroNome nomeInvertido))
  where nomeInvertido = inverteString (x:xs)



main = do
    -- 1
    let triangulo1 = Triangulo 1 1 1
    let triangulo2 = Triangulo 1 2 2
    let triangulo3 = Triangulo 1 2 3
    let triangulo4 = Triangulo 2 1 1
    
    putStrLn $ "Func 1. entrada: Triangulo 1 1 1 ; Resultado: " ++ show (classificarTriangulo triangulo1)
    putStrLn $ "Func 1. entrada: Triangulo 1 2 2 ; Resultado: " ++ show (classificarTriangulo triangulo2)
    putStrLn $ "Func 1. entrada: Triangulo 1 2 3 ; Resultado: " ++ show (classificarTriangulo triangulo3)
    putStrLn $ "Func 1. entrada: Triangulo 2 1 1 ; Resultado: " ++ show (classificarTriangulo triangulo4)


    -- 2
    putStrLn $ "Func 2. entrada:  4 \"345234678\" ; Resultado: " ++ show (fatias 4 "345234678")


    -- 3
    putStrLn $ "Func 3. entrada: 1 ; Resultado: " ++ show  (romanos 1)
    putStrLn $ "Func 3. entrada: 2 ; Resultado: " ++ show  (romanos 2)
    putStrLn $ "Func 3. entrada: 4 ; Resultado: " ++ show  (romanos 4)
    putStrLn $ "Func 3. entrada: 34 ; Resultado: " ++ show  (romanos 34)
    putStrLn $ "Func 3. entrada: 80 ; Resultado: " ++ show  (romanos 80)
    putStrLn $ "Func 3. entrada: 83 ; Resultado: " ++ show  (romanos 83)
    putStrLn $ "Func 3. entrada: 99 ; Resultado: " ++ show  (romanos 99)
    putStrLn $ "Func 3. entrada: 700 ; Resultado: " ++ show  (romanos 700)
    putStrLn $ "Func 3. entrada: 853 ; Resultado: " ++ show  (romanos 853)
    putStrLn $ "Func 3. entrada: 1000 ; Resultado: " ++ show  (romanos 1000)
    putStrLn $ "Func 3. entrada: 1233 ; Resultado: " ++ show  (romanos 1233)
    putStrLn $ "Func 3. entrada: 2547 ; Resultado: " ++ show  (romanos 2547)
    putStrLn $ "Func 3. entrada: 2786 ; Resultado: " ++ show  (romanos 2786)
    putStrLn $ "Func 3. entrada: 2999 ; Resultado: " ++ show  (romanos 2999)
    putStrLn $ "Func 3. entrada: 3000 ; Resultado: " ++ show  (romanos 3000)

    --Ex4
    putStrLn $ "Func 4. entrada:[[3,5,3],  [1,2,2],  [3,1,3],  [3,1,5]] ; Resultado: " ++ show (palindromosPrimos [[3,5,3],  [1,2,2],  [3,1,3],  [3,1,5]])


    -- Ex5
    putStrLn $ "Func 5. entrada:\"Ana Maria stzr\" ; Resultado: " ++ show (ultimoNome "Ana Maria stzrx")
