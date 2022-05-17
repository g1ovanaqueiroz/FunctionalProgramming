{-
- Usando os predicados not,and e or prontos de Haskell, implemente os predicados (funcoes) xor (or exclusivo),
- impl (implicacao A => B é equivalente a (not A or B)) e equiv (A <=> B é definido como A => B and B => A)
- Procure usar casamento de padroes e reutilizar as funcoes.
-}
xor :: Bool -> Bool -> Bool
xor a b = (a /= b)

impl :: Bool -> Bool -> Bool
impl a b = or [(not a),b]

equiv :: Bool -> Bool -> Bool
equiv a b = (impl a b) && (impl b a)

{-
A funcao square esta implementada e eleva ao quadrado um determinado numero
-}
square x = x*x

{-
- Implemente a funcao potencia, que retorna o resultado de x elevado a y 
-}
pow :: Float -> Float -> Float
pow x 0 = 1
pow x y
    |y>0 = x * (pow x (y-1))
    |otherwise = 1 / (pow x (-y))

{-
- Implemente a funcao fatorial que calcula o fatorial de um numero 
-}
fatorial :: Integer -> Integer
fatorial 0 = 1
fatorial a = a*(fatorial (a-1))

{-
- Determina se um numero eh primo ou nao. Preocupe-se apenas em resolver o problema.
- Nao precisa usar conhecimentos mais sofisticados da teoria dos numeros. Voce pode trabalhar com listas.
-}
isPrime :: Integer -> Bool
isPrime a
    |a<2 = False
    |otherwise = isPrime' a ([2.. (a-1)])

isPrime' :: Integer -> [Integer] -> Bool
isPrime' x [] = True
isPrime' x (y:ys) = if (mod x y) == 0 then False else isPrime' x ys

{-
- Calcula um termo da sequencia de Fibonnacci. Voce pode trabalhar com listas. 
-}
fib :: Integer -> Integer
fib 1 = 1
fib 2 = 1
fib x = (fib (x-1)) + (fib (x-2))

{-
- Calcula um MDC de dois numeros usando o algoritmo de Euclides. 
-}
mdc :: Integer -> Integer -> Integer
mdc 0 y = y
mdc x 0 = x
mdc x y = mdc y (mod x y)

{-
- Calcula um MMC de dois numeros. 
-}
mmc :: Integer -> Integer -> Integer
mmc a b = head (listDivisiveis a b)

listDivisiveis :: Integer -> Integer -> [Integer]
listDivisiveis a b = filter (divisivel a b) (auxList a b)

divisivel :: Integer -> Integer -> Integer -> Bool
divisivel a b c = (mod a c == 0) && (mod b c == 0)

auxList :: Integer -> Integer -> [Integer]
auxList a b = [2.. (min a b)]

{-
- Determina se dois numeros inteiros positivos sao co-primos. Dois numeros sao co-primos se 
- o mdc deles for igual a 1. Ex: coprimo 35 64 = True 
-}
coprimo :: Integer -> Integer -> Bool
coprimo a b = (mdc a b == 1)

{- FUNCOES SOBRE LISTAS -}
{-
- Implemente suas versoes para as funcoes abaixo sobre listas "myFunc", seguindo a mesma semantica da funcao original "func"
- Use pattern matching sempre que possivel ou entao guardas. 
- Voce nao pode utilizar as respectivas funcoes originais mas implementar sua própria logica
-}
myLength :: [a] -> Integer
myLength [] = 0
myLength (x:xs) = 1 + myLength xs

myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = (myReverse xs) ++ [x]

myTake :: Integer -> [a] -> [a]
myTake 0 _ = []
myTake _ [] = []
myTake n (x:xs) = (x:myTake (n-1) xs)

myDrop :: Integer -> [a] -> [a]
myDrop 0 xs = xs
myDrop n [] = []
myDrop n (x:xs) = myDrop (n-1) xs

myMaximum :: [Integer] -> Integer
myMaximum [x] = x
myMaximum (x:xs)
    |x > (myMaximum xs) = x
    |otherwise = myMaximum xs