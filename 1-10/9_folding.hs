-- foldr :: (a -> b -> b) -> b -> [a] -> b
-- the third b is the last element to do the operation
-- (a -> b -> b) is a function or operation

-- implementation of sum, and, or using foldr operation
sumAll :: [Int] -> Int
sumAll list = foldr (+) 0 list -- what happens if we change 0 to 1?

andAll :: [Bool] -> Bool
andAll list = foldr (&&) True list

orAll :: [Bool] -> Bool
orAll list = foldr (||) False list

-- foldr (\elem acc -> <term>) <start_acc> <list>
countOccurences :: Int -> [Int] -> Int
countOccurences e = foldr (\x acc -> if e==x then acc+1 else acc) 0  

-- length = foldr (\x -> (+) 1) 0
-- length = foldr (const $ (+) 1) 0
-- map f = foldr ((:) f) []

-- foldl (\acc elem -> <term>) <start_acc> <list>

main :: IO()
main = do
    let list = [1,2,3,4,5,6,7,8,9,10]
    print (sumAll list)
    print (sum list)

    let boolList = [True, True, False]
    print (andAll boolList)
    print (and boolList)
    print (orAll boolList)
    print (or boolList)