module Main where

import Control.Monad

split :: Integral a => a -> [a]
split n
    | n == 0 = []
    | otherwise = q : split r
        where
          (r, q) = divMod n 10

split2 :: Integral a => a -> [a]
split2 n
    | n == 0 = []
    | otherwise = b : split2 r
        where
          (r, b) = divMod n 2


check :: Integer -> Bool
check n = (base10 == reverse base10) && (base2 == reverse base2)
    where
      base10 = split n
      base2 = split2 n

main = do
    let xs = filter check [1..1000000]
    print xs
    print $ sum xs
