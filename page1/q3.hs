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

factorize :: Integral a => a -> [a]
factorize 1 = [1]
factorize 2 = [2]
factorize 3 = [3]
factorize n
    | n < 0 = []
    | n <= 3 = [n]
    | otherwise = iter divs
        where
          iter (x:xs)
            | x*x > n      = [n]
            | rem n x == 0 = (:) x $ factorize $ div n x
            | otherwise    = iter xs

main = print $ factorize 600851475143

