; Caio Henrique Martins dos Santos

; 1. Na  aula  disponível  em:  https://replit.com/@frankalcantara/ClojureAula2?v=1  foram destacadas diversas funções (expressões), como funções de primeira ordem, disponíveis em Clojure.  Sua  primeira  tarefa  será  descrever  cada  uma  destas  funções  e  apresentar dois exemplos  de  uso  de  cada  uma  delas.  Lembre-se  os  exemplos  precisam  ser  utilizados  de forma que o resutado da função possa ser visto no terminal.   


; 2. Utilizando a linguagem Clojure, crie uma função chamada ehPrimo que receba um inteiro e devolva True caso este inteiro seja verdadeiro e False caso contrário.  

(defn ehPrimo [i] 
    (empty? (filter #(== 0 (mod i %)) (range 2 i))))

(print "Func. 2; entrada 101; saida: ")
(println (ehPrimo 101))
(print "Func. 2; entrada 102; saida: ")
(println (ehPrimo 102))

; 3. Utilizando  a  linguagem  Clojure,  crie  uma  função  chamada  fatoresPrimos  que  receba  um inteiro e devolva uma lista dos seus fatores primos. Decomposição em fatores primos é uma tarefa fundamental da aritmética.  



; 4. Utilizando  a  linguagem  Clojure,  crie  uma  função  chamada  todosPrimos  que  receba  dois valores inteiros e devolve todos os números primos que existam entre estes dois valores.   

(defn todosprimos [i j]
    (doseq [ n (range i j)]
        (if (ehPrimo n)
            (print (str n " ")))))

(print "Func. 4; entrada 10 30; saida: ")
(todosprimos 10 30)
