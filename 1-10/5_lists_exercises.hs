
-- returns True if element is in a given List and false other wise
elem2 :: (Eq a) => a -> [a] -> Bool
elem2 a [] = False
elem2 a (x:xs) = if a == x then True else elem2 a xs

-- better style
elem3 :: (Eq a) => a -> [a] -> Bool
elem3 _ [] = False
elem3 e (x:xs) = (e == x) || elem3 e xs

-- removes all duplicates in a list
nub2 :: (Eq a) => [a] -> [a]
nub2 [] = []
nub2 (x:xs) = if elem3 x xs then nub2 xs else x:nub2 xs

-- true if list is in ascending order
isAsc :: [Int] -> Bool
isAsc [] = True
isAsc [_] = True
--isAsc (x:xs) = x <= head xs && isAsc xs cleaner version below
isAsc (x:y:xs) = (x <= y) && isAsc (y:xs)

-- determie if there is a path in the directed graph from one node to another
-- kinda tricky
hasPath :: [(Int,Int)] -> Int -> Int -> Bool
hasPath [] start end = start == end
hasPath graph start end
    | start == end = True
    | otherwise    = 
        let graph' = [ (start', end') | (start', end') <- graph, start' /= start ] in --remove all edges just took to start
            or [ hasPath graph' end' end | (start', end') <- graph, start==start' ] -- new starting node is the previous end node

main :: IO()
main = do
    let list = [1, 2, 3, 4, 5]
    print (elem2 3 list) --True
    print (elem2 6 list) --False
    print (elem3 3 list) --True
    print (elem3 6 list) --False

    let dupLists = [1, 2, 1, 2, 3, 3, 4, 5]
    print(nub2 dupLists) --[1,2,3,4,5]

    print(isAsc list) --True
    print(isAsc dupLists) --False

    let graph = [(1,2),(2,3),(3,2),(4,3),(4,5)]
    let start1 = 1
    let end1 = 3
    let start2 = 4
    let end2 = 1

    print(hasPath graph start1 end1) -- True
    print(hasPath graph start2 end2) -- False