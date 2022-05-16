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