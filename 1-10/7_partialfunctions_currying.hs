-- currying
{--
f :: a -> b -> c -> d
f :: a -> (b -> (c -> d))
--}

-- example currying for add with 2 arguments
add1 :: Int -> Int -> Int
add1 x y = x + y

add2 :: Int -> Int -> Int
add2 x = (\y -> x + y)

add3 :: Int -> Int -> Int
add3 = (\x -> (\y -> x + y))

main :: IO()
main = do
    -- a Int -> Int function
    let addOneFn = add3 1
    print (addOneFn 3)
    print (addOneFn 4)

    let doubleList = map (\x -> 2 * x)
    print (doubleList [1,2,3])