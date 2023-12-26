-- data Name = Constructor1 <args> | Constructor2 <args> | ...

-- data Color = Red | Orange | Yellow | Blue ...

-- data PeaNum = Succ PeaNum

data Calculation = 
    Add Int Int | Sub Int Int | Mul Int Int | Div Int Int

calc :: Calculation -> Int
calc (Add x y) = x + y
calc (Sub x y) = x - y
calc (Mul x y) = x * y
calc (Div x y) = div x y

data Tree a = Leaf | Node (Tree a) a (Tree a) -- Leaf or Node with left and right subtree

tree :: Tree Int
tree = Node (Node Leaf 1 Leaf) 2 (Node (Node Leaf 3 Leaf) 4 Leaf)