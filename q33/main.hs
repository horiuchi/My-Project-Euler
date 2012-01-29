module Main where

import Control.Monad

pattern = do
    x <- [1..9]
    a1 <- [1..9]
    b1 <- [1..(a1-1)]
    a2 <- [10*x+a1, a1*10+x] :: [Double]
    b2 <- [10*x+b1, b1*10+x] :: [Double]
    let c1 = b1 / a1
    let c2 = b2 / a2
    guard $ c1 == c2
    return [b1/a1, b2, a2]

main = do
    let ps = pattern
    print $ ps
    let xs = map (\[a,b,c] -> a) ps
    print $ foldr (*) 1 xs
