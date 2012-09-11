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

uniqList :: Integral a => a -> [a] -> [a]
uniqList x xs
    | x `elem` xs = xs
    | otherwise   = x:xs


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
            | rem n x == 0 = uniqList x $ factorize $ div n x
            | otherwise    = iter xs

check n = foldr1 (&&) $ map ((>=4).length.factorize) [n..(n+3)]

main = print $ head $ filter check [647..]

