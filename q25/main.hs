module Main where

fibs :: [Integer]
fibs = 1: 1: zipWith (+) fibs (tail fibs)

digits :: Integer -> Int
digits = (+1).truncate.(logBase 10).fromInteger

fib :: Int -> Integer
fib = iter 1 0 0 1
    where
      iter a b p q count
        | count == 0 = b
        | even count = iter a b (p*p+q*q) (2*p*q+q*q) (div count 2)
        | otherwise  = iter (b*q+a*p+a*q) (b*p+a*q) p q (count - 1)

fibDigits :: Int -> Int
fibDigits = length.show.fib

main = do
    print $ head $ dropWhile ((<1000).fibDigits) [1..]
