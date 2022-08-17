--Escreva um tipo Quadruple que contem 4 elementos: dois de um mesmo tipo e outros dois de outro tipo
--Escreva as funcoes frstTwo e secondTwo que retornam os dois primeiros e os dois ultimos, respectivamente

data Quadruple = Quadruple {
    a :: Int,
    b :: Int,
    c :: Char,
    d :: Char
} deriving (Eq,Show)

firstTwo (Quadruple a b c d) = (a, b)
secondTwo (Quadruple a b c d) = (c, d)

--Escreva um tipo de dados que pode conter um, dois, tres ou quatro elementos, dependendo do construtor
--Implemente funções tuple1 até tuple4 que que retornam Just <valor> ou Nothing se o valor nao existe
data Tuple a b c d = Tuple1 a | Tuple2 a b | Tuple3 a b c | Tuple4 a b c d deriving (Eq,Show)

tuple1 (Tuple1 a) = Just a
tuple1 (Tuple2 a b) = Just a
tuple1 (Tuple3 a b c) = Just a
tuple1 (Tuple4 a b c d) = Just a
tuple2 (Tuple1 _) = Nothing
tuple2 (Tuple2 a b) = Just b
tuple2 (Tuple3 a b c) = Just b
tuple2 (Tuple4 a b c d) = Just b
tuple3 (Tuple1 _) = Nothing
tuple3 (Tuple2 _ _) = Nothing
tuple3 (Tuple3 a b c) = Just c
tuple3 (Tuple4 a b c d) = Just c
tuple4 (Tuple1 _) = Nothing
tuple4 (Tuple2 _ _) = Nothing
tuple4 (Tuple3 _ _ _) = Nothing
tuple4 (Tuple4 a b c d) = Just d


data List a = Nil | Cons a (List a) deriving (Eq,Show)

listLength Nil = 0
listLength (Cons x xs) = 1 + listLength xs

listHead Nil = error "Empty list"
listHead (Cons x xs) = x

listTail Nil = error "Empty list"
listTail (Cons x xs) = xs

listFoldr f v Nil = v
listFoldr f v (Cons x xs) = f x (listFoldr f v xs)


listFoldl f v Nil = v
listFoldl f v (Cons x xs) = listFoldl f (f v x) xs 

--Escreva as funcoes sobre a estrutura de dados binary tree
data BinaryTree a = NIL | Node a (BinaryTree a) (BinaryTree a)
 deriving (Eq,Show)

sizeBST NIL = 0
sizeBST (Node a left right) = 1 + sizeBST left + sizeBST right

--verifica se uma BT é uma BST
isBST NIL = True
isBST (Node x left right) = (isEmpty left || (maximum_ left) < x) && (isEmpty right || x < (minimum_ right))

isEmpty NIL = True
isEmpty _ = False

--insere uma nova chave na BST retornando a BST modificada
insert v NIL = Node v NIL NIL
insert v (Node x left right)
    | v > x = insert v right
    | otherwise = insert v left

--retorna o Node da BST contendo o dado procurado ou entao NIL
search v NIL = NIL
search v (Node x left right)
    | v == x = (Node x left right)
    | v > x = search right
    | otherwise = search left

--retorna o elmento maximo da BST
maximum_ NIL = 0
maximum_ (Node x left right)
    | isEmpty right = x
    | otherwise = max x (maximum_ right)

--retorna o elemento minimo da BST
minimum_ NIL = 0
minimum_ (Node x left right)
    | isEmpty left = x
    | otherwise = min x (minimum_ left)

--retorna o predecessor de um elemento da BST, caso o elemento esteja na BST
predecessor = undefined

--retorna o sucessor de um elemento da BST, caso o elemento esteja na BST
successor = undefined

--remove ume lemento da BST
remove = undefined

--retorna uma lista com os dados da BST nos diversos tipos de caminhamento
preOrder = undefined
order = undefined
postOrder = undefined

-- AO FINAL DAS IMPLEMENTACOES, VOCE PRECISA MODULARIZAR O SEU CÓDIGO ACIMA DA SEGUINTE FORMA
-- COLOQUE TODA A IMPLEMENTACAO DE LISTA EM UM MODULO CHAMADO MYLIST
-- COLOQUE TODA A IMPLEMENTACAO DE ARVORE BINARIA EM UM MODULO CHAMADO BST