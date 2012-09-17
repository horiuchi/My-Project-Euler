module Main where

collatz :: Integer -> [Integer]
collatz 1 = 1:[]
collatz n | even n    = n : collatz (n `div` 2)
          | otherwise = n : collatz (3 * n + 1)

maximum_snd (x1,y1) (x2,y2) | y1 > y2   = (x1,y1)
                            | otherwise = (x2,y2)

main = print $ foldr maximum_snd (1,1) $ map (\l -> (head l, length l)) $ map collatz [1..1000000]

