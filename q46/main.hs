module Main where

import Control.Monad

divs :: Integral a => [a]
divs = 2 : 3 : [x+y | x <- [6, 12..], y <- [-1, 1]]

isPrime :: Integral a => a -> Bool
isPrime n = (n>1) && iter divs
    where
      iter (x:xs)
        | x*x > n      = True
        | rem n x == 0 = False
        | otherwise    = iter xs

check :: Integral a => a -> Bool
check n = check' n [1..]
    where
      check' n (x:xs)
        | n <= 2*x*x = False
        | isPrime (n-2*x*x) = True
        | otherwise = check' n xs

pattern = do
    n <- [9,11..]
    guard $ not $ isPrime n
    guard $ not $ check n
    return n

main = do
    let ps = pattern
    print $ head ps
