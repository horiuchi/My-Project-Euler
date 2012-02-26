module Main where

import Control.Monad

pentagonal :: Integral a => a -> a
pentagonal n = div (n * (3 * n - 1)) 2

isPentagonal :: Integral a => a -> Bool
isPentagonal n = check
    where
      r = 1 + fromIntegral(24*n+1)**0.5
      (m,f) = properFraction r
      isIntegral = f == 0.0
      isDividable = mod m 6 == 0
      check = isIntegral && isDividable

pattern = do
    n <- [3..]
    j <- [1..(div n 2)]
    let k = n - j
    guard $ k /= j
    let pk = pentagonal k
    let pj = pentagonal j
    guard $ isPentagonal $ pk + pj
    guard $ isPentagonal $ pk - pj
    return [pk-pj, pk+pj, k, j]

main = do
    let ps = pattern
    print $ head ps
