module Main where

diagonals :: Integer -> [Integer]
diagonals 0 = [1]
diagonals n = map f $ [m..(m+3)]
    where
      f x = 2 * n * x + 1
      m = 2 * (n - 1) + 1

main = print $ sum $ map (sum.diagonals) [0..500]
