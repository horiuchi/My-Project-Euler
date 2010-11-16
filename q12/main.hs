module Main where

count_tri_divs n
    | even n    = (count_divs $ n `div` 2) * (count_divs $ n + 1)
    | otherwise = (count_divs n) * (count_divs $ (n + 1) `div` 2)

-- tri_nums = 1:zipWith (+) tri_nums [2..]
triangle n = (n * (n + 1)) `div` 2

count_divs n = length [1|x<-[1..n], n `mod` x == 0]

-- main = print $ head $ filter ((>500).count_divs) $ tri_nums
main = print $ triangle $ head $ filter ((>500).count_tri_divs) [1..]

