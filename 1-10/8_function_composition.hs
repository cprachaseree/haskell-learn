import Data.List

-- dot or composition operator

-- (.) :: (b -> c) ->(a -> b) -> a -> c
-- (f . g) equiv. to (\x -> f (g x))

descSort1 :: [Int] -> [Int]
descSort1 = reverse . sort

descSort2 :: [Int] -> [Int]
descSort2 = (\x -> reverse (sort x))

descSort3 :: [Int] -> [Int]
descSort3 x = reverse (sort x)

-- dollar sign similar to map
-- ($) :: (a -> b) -> a -> b

addOneGreaterThanOne :: [Int] -> [Int]
addOneGreaterThanOne xs = map (\x -> x + 1) (filter (\x -> x > 1) xs)

addOneGreaterThanOne2 :: [Int] -> [Int]
addOneGreaterThanOne2 xs = map (\x -> x + 1) $ filter (\x -> x > 1) xs

-- avoidin lambda using infix
addOneGreaterThanOne3 :: [Int] -> [Int]
addOneGreaterThanOne3 xs = map (+ 1) $ filter (> 1) xs

sumEvens :: Int -> Int -> Int
sumEvens bottom top = sum $ filter even [bottom..top]

main :: IO()
main = do
    let list = [1,2,3,4,5]
    print (descSort1 list)
    print (descSort2 list)
    print (descSort3 list)

    print (addOneGreaterThanOne list)
    print (addOneGreaterThanOne2 list)
    print (addOneGreaterThanOne3 list)

    print (sumEvens 1 10)
    print (sumEvens 3 5)


