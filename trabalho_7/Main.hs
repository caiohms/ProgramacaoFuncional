-- Caio Henrique Martins dos Santos
-- Trabalho 7
-- Programação funcional
-- Frank Coelho de Alcântara
-- Outubro/2022

{--
1. Utilizando a linguagem Haskell e o seu próprio tipo de dados, crie um programa capaz de classificar triângulos a partir do comprimento dos seus lados sabendo que o comprimento de cada um dos lados deve ser maior que zero e que:  
a. triângulos equiláteros têm todos os lados do mesmo tamanho; 
b. triangulos esosceles têm, no mínimo, dois lados do mesmo tamanho;  
c. triangulos escalenos têm tem todos os lados de tamanho diferentes; 
d. triangulos degenerados têm um lado igual a soma dos outros dois e área zero.
--}

data Triangulo = Triangulo {
  lado_A :: Double, 
  lado_B :: Double,
  lado_C :: Double
} deriving (Show) 

classificarTriangulo :: Triangulo -> String
classificarTriangulo triangulo
  | lado_A triangulo  < 0 || lado_B triangulo < 0 || lado_C triangulo < 0 = "Triangulo invalido, um dos lados eh menor que zero"
  | lado_A triangulo == lado_B triangulo && lado_A triangulo == lado_C triangulo = "Triangulo equilatero"
  | lado_A triangulo == lado_B triangulo || lado_A triangulo == lado_C triangulo || lado_B triangulo == lado_C triangulo = "Triangulo esosceles"
  | lado_A triangulo /= lado_B triangulo && lado_A triangulo /= lado_C triangulo && lado_B triangulo /= lado_C triangulo = "Triangulo escaleno" 
  | lado_A triangulo  == 0 && lado_B triangulo == 0 && lado_C triangulo == 0 = "Triangulo degenerado" 
  | otherwise = "Triangulo não reconhecido"



{-
2. Usando Haskell, crie uma função chamada fatias, com a assinatura dada por fatias:: :: Int -> String -> [[Int]] que receba um string e um inteiro e devolva uma lista de listas contendo em cada  item  uma  lista  de  inteiros.  Esta  função  receberá  strings  contendo  digitos  como,  por exemplo:  "345234678"  e  devolverá  listas  parecidas  com [[3,4,5],[4,5,2],[5,2,3],[2,3,4],[3,4,6],[4,6,7],[6,7,8]] No caso do exemplo, o inteiro que fatias recebeu foi 3. Observe que você poderá criar, quantas funções de apoio acredite que sejam necessárias  para  criar  as  funcionalidades  de  fatias  inclusive,  se  achar  interessante,  pode usar as funções mapMaybe e digitToInt.
-}

import Data.Char

fatias :: Int -> String -> [[Int]]
fatias x (s:str) = 
    if length(s:str) >= x then [parseSubstring (take x string)] ++ fatias x str 
    else [] 
    where string = s:str

parseSubstring :: String -> [Int]
parseSubstring (s:str) =
    if str == [] then [digitToInt s]
    else [digitToInt s] ++ parseSubstring str


{-
3. Usando  Haskell  escreva  uma  função  chamada  romanos  que  receba  um  inteiro  menor ou igual a 3000 e devolva um string deste inteiro representado com algarismos romanos.  
-}

romanos :: Int -> String




main = do
  putStrLn $ "Resultado:" ++ show (fatias 4 "345234678")
