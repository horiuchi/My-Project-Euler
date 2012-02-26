module Main where

import Control.Monad

hexagonal :: Integral a => a -> a
hexagonal n = n * (2 * n - 1)

isPentagonal :: Integral a => a -> Bool
isPentagonal n = check
    where
      r = 1 + fromIntegral(24*n+1)**0.5
      (m,f) = properFraction r
      isIntegral = f == 0.0
      isDividable = mod m 6 == 0
      check = isIntegral && isDividable

isTriangle :: Integral a => a -> Bool
isTriangle n = check
    where
      r = -1 + fromIntegral(8*n+1)**0.5
      (m,f) = properFraction r
      isIntegral = f == 0.0
      isDividable = mod m 2 == 0
      check = isIntegral && isDividable

pattern = do
    n <- [144..]
    let h = hexagonal n
    guard $ isPentagonal h
    guard $ isTriangle h
    return [h, n]

main = do
    let ps = pattern
    print $ head ps
