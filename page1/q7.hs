module Main where

primes = sieve [2..]
    where
      sieve (p:xs) = p : (sieve $ filter ((/=0).(`mod`p)) xs)

main = print $ head $ drop 10000 primes
