module Main where

binomial 0 _ = 1
binomial _ 0 = 1
binomial n k | n == k    = 1
             | otherwise = binomial (n-1) (k-1) + binomial (n-1) k

binomial_list n = [binomial n k| k <- [0..n]]

reduce [] = []
reduce (x:[]) = []
reduce (x:xs) = (x + head xs) : reduce xs

reduce' l = if length l <= 1 then l else reduce' (reduce l)

main = print $ reduce' $ binomial_list 20

