module Main where

sumOfDivisors :: (Integral a) => a -> a
sumOfDivisors n = sum $ divisors n
    where
      divisors n = filter (\x -> mod n x == 0) [1..n-1]

isAmicable :: (Integral a) => a -> Bool
isAmicable n = n /= sum && n == sumOfDivisors sum
    where
      sum = sumOfDivisors n

main = print $ sum $ filter isAmicable [1..10000]

