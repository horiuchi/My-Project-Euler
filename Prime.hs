module Prime where

primes = sieve [2..]
    where
      sieve (p:xs) = p : (sieve $ filter ((/=0).(`mod`p)) xs)

primes_below n = sieve [2..n]
    where
      sieve []     = []
      sieve (p:xs) = p : (sieve $ filter ((/=0).(`mod`p)) xs)

