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

divs :: Integral a => [a]
divs = 2 : 3 : [x+y | x <- [6, 12..], y <- [-1, 1]]

isPrime :: Integral a => a -> Bool
isPrime n = (n>1) && iter divs
    where
      iter (x:xs)
        | x*x > n      = True
        | rem n x == 0 = False
        | otherwise    = iter xs

pandigital :: (Integral a) => a -> [a] -> Bool
pandigital n xs = length xs == fromIntegral n && _check xs [1..n]
    where
      _check xs [] = True
      _check xs (y:ys)
        | y `elem` xs = _check xs ys
        | otherwise = False

check :: Integral a => a -> Bool
check n = b1 && b2
    where
      b1 = pandigital 8 $ split n
      b2 = isPrime n

pattern = do
    n <- [1234567..9876543]
    guard $ isPrime n
    guard $ pandigital 7 $ split n
    return n

main = do
    let ps = pattern
    print ps
    print $ maximum ps
