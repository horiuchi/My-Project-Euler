module Main where

import Control.Monad


split :: Integral a => a -> [a]
split n
    | n == 0 = []
    | otherwise = q : split r
        where
          (r, q) = divMod n 10

factorial :: Integral a => a -> a
factorial n = foldr (*) 1 [1..n]

check :: Integer -> Bool
check n = n == calc
    where
      calc = sum $ map factorial $ split n

main = do
    let xs = filter check [3..3000000]
    print xs
    print $ sum xs
