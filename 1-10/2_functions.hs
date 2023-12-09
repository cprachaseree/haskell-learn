-- https://youtu.be/pitjnqRKyyI?si=goBTSCLZpnMN7n9x

-- Note that there is no return like imperative languages
inRange :: Integer -> Integer -> Integer -> Bool
inRange min max x =
    x >= min && x <= max

-- let example
inRangeLet :: Integer -> Integer -> Integer -> Bool
inRangeLet min max x = 
    let 
        inLowerBound = min <= x
        inUpperBound = max >= x
    in
        inLowerBound && inUpperBound

-- where example
inRangeWhere :: Integer -> Integer -> Integer -> Bool
inRangeWhere min max x = 
    inLowerBound && inUpperBound
    where
        inLowerBound = min <= x
        inUpperBound = max >= x

boolToString :: Bool -> String
boolToString x = if x then "IN RANGE" else "NOT IN RANGE" 

getFunctionRange :: Integer -> Integer -> Integer -> Integer -> String
getFunctionRange input lowerBound upperBound checkNumber
    | input == 1 = boolToString (inRange lowerBound upperBound checkNumber) 
    | input == 2 = boolToString (inRangeLet lowerBound upperBound checkNumber)
    | input == 3 = boolToString (inRangeWhere lowerBound upperBound checkNumber)
    | otherwise = "Invalid input"

main::IO()
main = do 
    putStrLn "Check if an Integer is in range"
    putStrLn "input lower bound: "
    inputLowerBound <- getLine
    putStrLn "input upper bound: "
    inputUpperBound <- getLine
    putStrLn "input number to check: "
    inputCheckNumber <- getLine
    putStrLn "Select function implementation (1) one liner (2) using let  (3) using where:"
    inputFunctionImplementation <- getLine
    let input = (read inputFunctionImplementation :: Integer)
    let lowerBound = (read inputLowerBound :: Integer)
    let upperBound = (read inputUpperBound :: Integer)
    let checkNumber = (read inputCheckNumber :: Integer)
    putStrLn (getFunctionRange input lowerBound upperBound checkNumber)