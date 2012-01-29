module Main where

import Control.Monad

uniq :: [Integer] -> [Integer]
uniq [] = []
uniq (x:xs)
    | x `elem` xs = uniq xs
    | otherwise = x : uniq xs

split :: Integral a => a -> [a]
split n
    | n == 0 = []
    | otherwise = q : split r
        where
          (r, q) = divMod n 10

check :: [Integer] -> Bool
check xs = length xs == 9 && _check xs [1..9]
    where
      _check xs [] = True
      _check xs (y:ys)
        | y `elem` xs = _check xs ys
        | otherwise = False

pattern = do
    a <- [1..98]
    b <- [12..9876]
    let c = a * b
        xs = concatMap split [a,b,c]
    guard $ check xs
    return [a,b,c]

main = do
    let ps = pattern
    print $ ps
    let xs = uniq $ map (\[a,b,c] -> c) ps
    print $ xs
    print $ sum xs
