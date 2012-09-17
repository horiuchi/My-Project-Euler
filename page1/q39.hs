module Main where

import Control.Monad

pattern p = do
    c <- [1..(div p 2)]
    a <- [1..(div (p-c) 2)]
    let b = p - c - a
    guard $ c*c == a*a + b*b
    return [a,b,c]

main = do
    let input = [12..1000]
    let ps = map pattern input
    print ps
    let res = map length ps
    print $ maximum $ zip res input
