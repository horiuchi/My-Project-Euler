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

joinn :: Integral a => [a] -> a
joinn = foldl ((+).(*10)) 0

check :: [Integer] -> Bool
check xs = length xs == 9 && _check xs [1..9]
    where
      _check xs [] = True
      _check xs (y:ys)
        | y `elem` xs = _check xs ys
        | otherwise = False

pattern = do
    x <- [1..9876]
    n <- [2..9]
    let ys = concatMap (reverse.split) $ map (*x) [1..n]
    guard $ check ys
    return $ joinn ys

main = do
    let ps = pattern
    print ps
    print $ maximum ps
