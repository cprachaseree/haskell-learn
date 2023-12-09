-- Factorials
factorial :: Integer -> Integer
factorial n = if n <= 1 then 1 else n * factorial (n-1)

factorialGuards :: Integer -> Integer
factorialGuards n
    | n <= 1    = 1
    | otherwise = n * factorialGuards (n-1)

-- Using accumulator to do tail recursion in auxiliary function
factorialTail :: Integer -> Integer
factorialTail n = factorialTail' n 1
    where
        factorialTail' n acc
            | n <= 1    = acc
            | otherwise = factorialTail' (n-1) (n*acc)

main :: IO()
main = do
    print (factorial 5)
    print (factorialGuards 5)
    print (factorialTail 5)