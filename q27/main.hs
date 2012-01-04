module Main where

squareRoot :: Integer -> Integer
squareRoot 0 = 0
squareRoot 1 = 1
squareRoot n = head $ dropWhile (not . isRoot) iters
    where
      twopows = iterate (^2) 2
      (lowerRoot, lowerN) =
        last $ takeWhile ((n>=).snd) $ zip (1:twopows) twopows
      newtonStep x = div (x + div n x) 2
      iters = iterate newtonStep (squareRoot (div n lowerN) * lowerRoot)
      isRoot r = r^2 <= n && n < (r+1)^2

isPrime :: Integer -> Bool
isPrime n
    | n <= 1 = False
    | n <= 3 = True
    | otherwise = divideBySquare n
      where
        sequence n = takeWhile (squareRoot n>=) $ 2: iterate (+2) 3
        divideBySquare n = foldr (&&) True $ map ((/=0).(mod n)) $ sequence n

calcFormula :: Num a => a -> a -> a -> a
calcFormula a b n = n^2 + a*n + b

primeValues :: Integer -> Integer -> [Integer]
primeValues a b = takeWhile isPrime $ map (calcFormula a b) [0..]

main = do
    let coefficients = [(a,b) | b<-[3,5..1000], a<-[-b,-b+2..999], (mod a 2)/=0, isPrime b]
    --print $ maximum $ map (\x -> (length $ uncurry primeValues $ x, x)) $ coefficients
    print $ length $ coefficients
    print $ filter ((50<).fst) $ map (\x -> (length $ uncurry primeValues $ x, x)) $ coefficients
