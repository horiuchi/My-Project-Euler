module Main where

import Control.Monad

split :: Integral a => a -> [a]
split n
    | n == 0 = []
    | otherwise = q : split r
        where
          (r, q) = divMod n 10

joinn :: Integral a => [a] -> a
joinn = foldl ((+).(*10)) 0

cyclic :: Integral a => [a] -> [[a]]
cyclic xs = _cyclic xs $ length xs
    where
      _cyclic _ 0 = []
      _cyclic xs n = (xs2 ++ xs1) : _cyclic xs (n-1)
        where
          (xs1, xs2) = splitAt (length xs - n) xs

divs :: Integral a => [a]
divs = 2 : 3 : [x+y | x <- [6, 12..], y <- [-1, 1]]

isPrime :: Integral a => a -> Bool
isPrime n = (n>1) && iter divs
    where
      iter (x:xs)
        | x*x > n      = True
        | rem n x == 0 = False
        | otherwise    = iter xs


check :: Integer -> Bool
check n = foldr (&&) True $ map isPrime $ ns
    where
      ns = map joinn $ cyclic $ reverse $ split n

main = do
    let xs = filter check $ filter isPrime [2..1000000]
    print xs
    print $ length xs
