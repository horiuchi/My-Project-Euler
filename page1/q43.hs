module Main where

import Control.Monad

joinn :: Integral a => [a] -> a
joinn = foldl ((+).(*10)) 0

pattern = do
    d4 <- [0,2..8]
    d2 <- [0..9]
    guard $ d2 /= d4
    d3 <- [0..9]
    guard $ d3 /= d2 && d3 /= d4
    d5 <- [0..9]
    guard $ all (/=d5) [d2,d3,d4]
    guard $ 0 == mod (d3+d4+d5) 3
    d6 <- [0,5]
    guard $ all (/=d6) [d2,d3,d4,d5]
    d7 <- [0..9]
    guard $ all (/=d7) [d2,d3,d4,d5,d6]
    guard $ 0 == mod (joinn [d5,d6,d7]) 7
    d8 <- [0..9]
    guard $ all (/=d8) [d2,d3,d4,d5,d6,d7]
    guard $ 0 == mod (joinn [d6,d7,d8]) 11
    d9 <- [0..9]
    guard $ all (/=d9) [d2,d3,d4,d5,d6,d7,d8]
    guard $ 0 == mod (joinn [d7,d8,d9]) 13
    d10 <- [0..9]
    guard $ all (/=d10) [d2,d3,d4,d5,d6,d7,d8,d9]
    guard $ 0 == mod (joinn [d8,d9,d10]) 17
    d1 <- [0..9]
    guard $ all (/=d1) [d2,d3,d4,d5,d6,d7,d8,d9,d10]
    return $ joinn [d1,d2,d3,d4,d5,d6,d7,d8,d9,d10]

main = do
    let ps = pattern
    print $ sum ps
