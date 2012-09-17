module Util where

uniq :: [Integer] -> [Integer]
uniq [] = []
uniq (x:xs)
    | x `elem` xs = uniq xs
    | otherwise = x : uniq xs


splitNum :: Integral a => a -> [a]
splitNum n
       | n == 0 = []
       | otherwise = q : splitNum r
           where
             (r, q) = divMod n 10

joinNum :: Integral a => [a] -> a
joinNum = foldl ((+).(*10)) 0

