import System.Random

pair :: [Double] -> [(Double,Double)]
pair [] = []
pair (x:y:xs) = (x,y) : pair xs

calcDist :: [(Double,Double)] -> [Double]
calcDist [] = []
calcDist ((x, y):xs) = x * x + y * y : calcDist xs

-- count the number of points inside the circle and outside the circle
countPoints :: [Double] -> Integer -> Integer -> (Integer, Integer)
countPoints [] inside outside = (inside, outside)
countPoints (x:xs) inside outside
    | x >= 1    = countPoints xs inside (outside+1)
    | otherwise = countPoints xs (inside+1) outside

calcPi :: (Integer,Integer) -> Double
calcPi (inside,outside) = 4 * (fromIntegral inside) / (fromIntegral (inside + outside))

-- Got 3.1415656 in 5000000 pairs!
main :: IO ()
main = do
    g <- getStdGen
    let list = take 10000000 (randomRs (0 :: Double, 1 :: Double) g)
    let pairedList = pair list
    let distList = calcDist pairedList
    let counts = countPoints distList 0 0
    let pi = calcPi counts
    print pi