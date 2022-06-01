{-
- Encontra o penultimo elemento de uma lista. Caso a lista seja vazia ou tenha apenas um elemento retorne o seguinte comando: error "Lista sem penultimo" 
-}
penultimo :: [a] -> a
penultimo [] = error "Lista sem penultimo"
penultimo [x] = error "Lista sem penultimo"
penultimo xs = (last.init) xs

{-
- Retorna o k-esimo (k varia de 0 ate N-1) elemento de uma lista. Ex: elementAt 2 [4,7,1,9] = 7
-}
elementAt :: Integer -> [a] -> a
elementAt _ [] = error "Out of range"
elementAt 1 (x:xs) = x
elementAt i (x:xs) = elementAt (i-1) xs

{-
- Diz se uma lista é palindrome. 
-}
isPalindrome [] = True
isPalindrome [x] = True
isPalindrome xs
    | (head xs == last xs) = isPalindrome ((tail.init) xs)
    | otherwise = False

{-
- Remove os elementos duplicados de uma lista. Ex: compress [2,5,8,2,1,8] = [2,5,8,1]
- Voce pode usar a funcao elem de Haskell
-}
compress [] = []
compress (x:xs)
    | elem x xs =  x: (compress (filter (/= x) xs))
    | otherwise = x : (compress xs)

{-
- Varre a lista da esquerda para a direita e junta os elementos iguais. Ex: compact [2,5,8,2,1,8] = [2,2,5,8,8,1]
- Voce pode usar funcoes sobre listas como : (cons), filter, etc.
-}
compact [] = []
compact xs = (filter (== head xs) xs) ++ compact (filter (/= head xs) (tail xs))


{-
- Retorna uma lista de pares com os elementos e suas quantidades. Ex: encode [2,2,2,3,4,2,5,2,4,5] = [(2,5),(3,1),(4,2),(5,2)]
- Voce pode usar funcoes sobre listas como : (cons), filter, etc.
-}
encode [] = []
encode xs = zip (compress xs) (countElem (compress xs) xs)

countElem [] _ = []
countElem (x:xs) ys =  (length.filter (==x)) ys : countElem xs (filter (/=x) (tail ys))

{-
- Divide uma lista em duas sublistas onde o ponto de divisao é dado. Ex: split [3,6,1,9,4] 3 = [[3,6,1],[9,4]]
-}
split [] _ = []
split xs i = [(take i xs), (drop i xs)]

{-
- Extrai um pedaço (slice) de uma lista especificado por um intervalo. 
- Ex: slice [3,6,1,9,4] 2 4 = [6,1,9]
-}
slice [] _ _ = []
slice xs imin imax = drop (imin-1) (take imax xs)

{-
- Insere um elemento em uma posicao especifica de uma lista. 
- Ex: insertAt 7 4 [3,6,1,9,4] = [3,6,1,7,9,4]
-}
insertAt el 1 xs = el:xs
insertAt el pos xs = (take (pos-1) xs) ++ [el] ++ (drop (pos-1) xs)

{-
- Ordena uma lista em ordem crescente. Voce deve seguir a ideia do selectionsort onde os elementos 
- menores sao trazidos para o inicio da lista um a um. Esta funcao ja esta implementada.
-}
minList [x] = x
minList (x:xs) = if (x < (minList xs)) then x else minList xs

remove e (x:xs) | e == x = xs
                | otherwise = x:(remove e xs)
sort [] = []
sort xs = x:ys 
    where
        x = minList xs
        ys = sort (remove x xs) 

{-
- Dada a funcao max que retorna o maximo entre dois numeros, escreva uma funcao que usa a função
- foldr e max para retornar o maximo de uma lista se a lista não é vazia.
-}
maxList [] = error "Empty list"
maxList xs = foldr max n ys
    where
        n = last xs
        ys = init xs

{-
- Transforma uma string em uma palindrome acrescentando o reverso da string ao seu final sem usar a funcao reverse. 
- Ex: buildPalindrome [1,2,3] = [1,2,3,3,2,1]. 
-}
buildPalindrome xs 
    | isPalindrome xs = xs
    | otherwise = xs ++ buildPalindrome' xs

buildPalindrome' [] = []
buildPalindrome' xs = [last xs] ++ (buildPalindrome' (init xs))

{-
- Computa a media dos elementos de uma lista de numeros, sem usar nenhuma funcao pronta de listas.
-}

mean [] = 0
mean xs = fromIntegral(mySum xs)/fromIntegral(myLength xs)

mySum [] = 0
mySum (x:xs) = x + mySum xs

myLength [] = 0
myLength (x:xs) = 1 + myLength xs

{-
- Escreva a funcao myAppend que faz o append de uma lista xs com a lista ys, usando a função foldr. 
-}
myAppend xs ys = foldr (:) ys xs

{-
- Encontra o primeiro elemento da lista que satisfaz o predicado p ou entao retorna um erro
-}
find :: (a -> Bool) -> [a] -> a
find p [] = error "No element found"
find p (x:xs)
    | p x = x
    | otherwise = find p xs

{- 
- Implementar quick sort usando compreensao de listas
-}
quickSort [] = []
quickSort (x:xs) = (quickSort smaller) ++ [x] ++ (quickSort greater) 
    where
      smaller = [y | y <- xs, y <= x]
      greater = [y | y <- xs, y > x]

{- 
- Implementar quick sort usando filter
-}
quickSortFilter [] = []
quickSortFilter (x:xs) = (quickSortFilter smaller) ++ [x] ++ (quickSortFilter greater)
    where
        smaller = filter (<=x) xs
        greater = filter (>x) xs

{-
- Implemente uma funcao que soma todos os elementos de uma lista usando foldl
-}
sumFoldl xs = foldl (+) 0 xs

{-
- Retorna uma lista sem repeticao a partir de uma lista possivelmente com elementos repetidos
-}
unique xs = undefined

{-
- Conta a quantidade de ocorrencias de um elemento em uma lista
-}
count x xs = undefined

{-
- Dada uma lista de elementos possivelmente repetidos, retorna uma lista de 
- pares contendo um elemento da lista odiginal e sua quantidade de ocorrencias
- Cada elemento da lista original possui apenas um par correspondente na lista de resposta
-}
frequencia xs = undefined

{-
- Funcao concat definida usando foldr
- A funcao concat representa a concatenacao distribuida de listas. Ou seja, recebe uma lista de 
- listas e realiza a concatenacao de todas as listas. 
- Ex: concat [[1,2],[3,4]] = [1,2,3,4]
-}
concatFoldr xs = undefined