-- [1, 2, 3, 4, 5] is constructed from 1 : 2 : 3 : 4 : 5 : []

-- Functions on Lists
import Data.List

-- generating a list
ascending :: Int -> Int -> [Int]
ascending n m
    | m < n     = []
    | otherwise = n : ascending (n+1) m

-- Use of pattern matching
sumMine :: [Int] -> Int
sumMine [] = 0
sumMine (x:xs) = x + sumMine xs

evensMine :: [Int] -> [Int]
evensMine [] = []
evensMine (x:xs)
    | mod x 2 == 0 = x : evensMine xs
    | otherwise    = evensMine xs

addTuples :: [(Int, Int)] -> [Int]
addTuples xs = [ x+y | (x, y) <- xs ]

main :: IO()
main = do
    let n = 1
    let m = 8
    let ascendingList = ascending n m
    putStrLn "Original List"
    print ascendingList
    putStrLn "head of list"
    print (head ascendingList)
    putStrLn "tail of list"
    print (tail ascendingList)
    putStrLn "length of list"
    print (length ascendingList)
    putStrLn "init (copy of list without last element)"
    print (init ascendingList)
    putStrLn "check if list is empty with null"
    print (null ascendingList)

    -- Functions on lists of booleans
    let boolList = [True, False, True]
    -- and :: [Bool] -> Bool
    -- or :: [Bool] -> Bool
    putStrLn "and [True, False, True]"
    print (and boolList)
    putStrLn "or [True, False, True]"
    print (or boolList)

    -- List patterns
    putStrLn "sum"
    print (sumMine ascendingList)
    putStrLn "evens"
    print (evensMine ascendingList)

    putStrLn "Builtin tuple functions"
    let exampleTuple = (1, 4)
    print exampleTuple
    putStrLn "fst exampleTuple"
    print (fst exampleTuple)
    putStrLn "snd exampleTuple"
    print (snd exampleTuple)

    -- list comprehension
    let multiplyByTwo = [ 2*x | x <- ascendingList, x > 2]
    print multiplyByTwo