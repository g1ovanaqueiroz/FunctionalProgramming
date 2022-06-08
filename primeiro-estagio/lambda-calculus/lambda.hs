--Exemplos de expressoes lambda
square = \x -> x*x

--Implemente as funções anteriormente escritas usando expressões lambda
--consulte suas implementacoes anteriores para a documentacao dessas funcoes
pow = \x y -> x**y

fatorial = \x -> if (x == 0) then 1 else (x * fatorial (x-1))

isPrime = \x -> 
    case x of
        1 -> False
        2 -> True
        3 -> True
        x -> not (any (\y -> x `mod` y == 0) [2..x - 1])

fib = \x ->
    case x of
        1 -> 1
        2 -> 1
        x -> (fib (x-1)) + (fib (x-2))

mdc = \x y -> if (x==0) then y else if (y==0) then x else (mdc y (mod x y))

mmc = \x y -> head (filter ((\x y z -> (mod x z == 0) && (mod y z == 0)) x y) [2.. (min x y)])

coprimo = \x y -> (mdc x y == 1)

goldbach = \x -> [(a,b) | a <- filter isPrime [2..x-1], b <- filter isPrime [2..x-1], a+b == x]

--Implemente as funções sobre listas escritas previsamente usando expressões lambda
--consulte suas implementacoes anteriores para a documentacao dessas funcoes
meuLast = \x -> (drop ((length x)-1) x)

penultimo = \x -> (last.init) x

elementAt = \i xs -> if (i==1) then head xs else elementAt (i-1) (tail xs)

meuLength = \x ->
    case x of
        [] -> 0
        [e] -> 1
        (y:ys) -> 1 + meuLength ys

meuReverso = \x ->
    case x of
        [] -> []
        [e] -> [e]
        (y:ys) -> (meuReverso ys) ++ [y]

isPalindrome :: [Char] -> Bool
isPalindrome = \x -> if ((meuLength x) == 1 || (meuLength x) == 0) then True else if (head x== last x) then isPalindrome ((tail.init) x) else False

isPalindrome' :: [Integer] -> Bool
isPalindrome' = \x -> if ((meuLength x) == 1 || (meuLength x) == 0) then True else if (head x== last x) then isPalindrome' ((tail.init) x) else False

compress xs = undefined
compact xs = undefined
encode xs = undefined
split xs i = undefined
slice xs imin imax = undefined
insertAt el pos xs = undefined
sort xs = undefined
mySum xs = undefined
maxList xs = undefined
buildPalindrome xs = undefined
mean xs = undefined
myAppend xs ys = undefined