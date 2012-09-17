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

lefts :: Integral a => [a] -> [[a]]
lefts [] = [[]]
lefts (x:xs) = xs : lefts xs

pattern :: Integral a => [a] -> [[a]]
pattern ns = rights ++ lefts ns
    where
      rights = map reverse $ lefts $ reverse ns

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
      ns = filter (>0) $ map joinn $ pattern $ reverse $ split n

main = do
    let xs = take 11 $ filter check $ filter isPrime [11..]
    print xs
    print $ sum xs
