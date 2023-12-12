-- higher order functions
exHigherOrderFn :: (a -> b) -> a -> b
exHigherOrderFn f x = f x

add1 :: Int -> Int
add1 x = x + 1

-- Anonymouys function
add1New :: Int -> Int
add1New = (\x -> x + 1)

main :: IO()
main = do 
    print (exHigherOrderFn add1 1)

    -- map example
    let add1ListResult = map (\x -> x+1) [1,2,3,4]
    print add1ListResult

    let summedTuples = map (\(x,y) -> x+y) [(1,2),(3,4),(5,6)]
    print summedTuples

    let greaterThanTwo = filter (\x -> x > 2) [1,2,3,4,5]
    print greaterThanTwo

    let diff = filter (\(x,y) -> x /= y) [(1,2),(2,2),(2,3),(3,3)]
    print diff