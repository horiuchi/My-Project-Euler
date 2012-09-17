module Main where

split :: Integer -> [Integer]
split n
    | n == 0 = []
    | otherwise = q : split r
        where
          (r, q) = divMod n 10

fifthpowers :: Integer -> Integer
fifthpowers = sum.(map (^5)).split

check :: Integer -> Bool
check n = n == fifthpowers n

main = print $ sum $ filter check [2..999999]

