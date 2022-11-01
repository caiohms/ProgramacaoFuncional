; Caio Henrique Martins dos Santos

; 1. Na  aula  disponível  em:  https://replit.com/@frankalcantara/ClojureAula2?v=1  foram destacadas diversas funções (expressões), como funções de primeira ordem, disponíveis em Clojure.  Sua  primeira  tarefa  será  descrever  cada  uma  destas  funções  e  apresentar dois exemplos  de  uso  de  cada  uma  delas.  Lembre-se  os  exemplos  precisam  ser  utilizados  de forma que o resutado da função possa ser visto no terminal.   

; 1 - assoc - Retorna um novo map contendo o mapeamento de chave e valor
(println "Func. 1 - assoc; entrada: {:a 1 :b 2} :a 3; saida: " (assoc {:a 1 :b 2} :a 3))
(println "Func. 1 - assoc; entrada: {:a 5 :b 6} :a 1; saida: " (assoc {:a 5 :b 6} :a 1))

; 1 - dissoc - Retorna um novo map desassociando a chave passada como parametro
(println "Func. 1 - dissoc; entrada: {:a 1 :b 2} :a; saida: " (dissoc {:a 1 :b 2} :a))
(println "Func. 1 - dissoc; entrada: {:a 5 :b 6} :a; saida: " (dissoc {:a 5 :b 6} :a))

; 1 - range - Retorna sequencia de 0 a n no caso de um parametro ou n até m no caso de 2 parâmetros.
(println "Func. 1 - range; entrada: 5; saida: " (range 5))
(println "Func. 1 - range; entrada: 5 10; saida: " (range 5 10))

; 1 - map - Retorna sequencia com o resultado da aplicação de uma funcao ao conjunto dos primeiros itens de cada coleção, seguido pela aplicação de f ao conjunto de segundos itens em cada coleção.
(println "Func. 1 - map; entrada: + [1,2,3] [4,5,6]; saida: " (map + [1,2,3] [4,5,6]))
(println "Func. 1 - map; entrada: - [1,2,3] [4,5,6]; saida: " (map - [1,2,3] [4,5,6]))

; 1 - inc - incrementa 1 ao valor de entrada
(println "Func. 1 - inc; entrada: 1; saida: " (inc 1))
(println "Func. 1 - inc; entrada: 2; saida: " (inc 2))

; 1 - filter - Filtra os itens de uma coleção de acordo com função passada
(println "Func. 1 - filter; entrada: even? [0,1,2,3,4,5]; saida: " (filter even? [0,1,2,3,4,5]))
(println "Func. 1 - filter; entrada: odd? (range 10 15); saida: " (filter odd? (range 10 15)))

; 1 - odd - true caso numero passado seja impar
(println "Func. 1 - odd; entrada: 1; saida: " (odd? 1))
(println "Func. 1 - odd; entrada: 10; saida: " (odd? 10))

; 1 - into - Retorna nova coleção contendo todos os itens da coleção de origem unidos
(println "Func. 1 - into; entrada: () '(1 2); saida: " (into () '(1 2)))
(println "Func. 1 - into; entrada: [1 2 3] '(4 5 6); saida: " (into [1 2 3] '(4 5 6)))

; 1 - nth - retorna enésimo elemento da coleção
(println "Func. 1 - nth; entrada: [0,1,2,3] 3; saida: " (nth [0,1,2,3] 3))
(println "Func. 1 - nth; entrada: [0,1,2,3,4,5] 0; saida: " (nth [0,1,2,3,4,5] 0))

; 1 - conj - retorna conjuncao dos itens passados
(println "Func. 1 - conj; entrada: [1,2,3] 3; saida: " (conj [1,2,3] 4))
(println "Func. 1 - conj; entrada: [1,2,3] [1,2]; saida: " (conj [1,2,3] [1,2]))

; 1 - sort - retorna coleção fornecida ordenada
(println "Func. 1 - sort; entrada: [2,1,5,3]; saida: " (sort [2,1,5,3]))
(println "Func. 1 - sort; entrada: [4,3,2,1]; saida: " (sort [4,3,2,1]))

; 1 - partition-by - aplica f a cada valor na collection, dividindo quando f retorna um novo valor
(println "Func. 1 - partition-by; entrada: #(= 3 %) [1 2 3 4 5]; saida: " (partition-by #(= 3 %) [1 2 3 4 5]))
(println "Func. 1 - partition-by; entrada: even? [1 1 1 2 2 3 3]; saida: " (partition-by even? [1 1 1 2 2 3 3]))

; 1 - empty - retorna coleção vazia do mesmo tipo da coleção passada
(println "Func. 1 - empty; entrada: [1 2 3]; saida: " (empty [1 2 3]))
(println "Func. 1 - empty; entrada: {1 2 3}; saida: " (empty {1 2}))

; 1 - count - true caso numero passado seja impar
(println "Func. 1 - count; entrada: [1]; saida: " (count [1]))
(println "Func. 1 - count; entrada: [1 2 3 4]; saida: " (count [1 2 3 4]))

; 1 - char - retorna char equivalente ao numero passado, pelo seu codigo ASCII
(println "Func. 1 - char; entrada: 100; saida: " (char 100))
(println "Func. 1 - char; entrada: 101; saida: " (char 101))


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
