module Prime where

primes = sieve [2..]
    where
      sieve (p:xs) = p : (sieve $ filter ((/=0).(`mod`p)) xs)

primes_below n = sieve [2..n]
    where
      sieve []     = []
      sieve (p:xs) = p : (sieve $ filter ((/=0).(`mod`p)) xs)


divs :: Integral a => [a]
divs = 2 : 3 : [x+y | x <- [6, 12..], y <- [-1, 1]]

isPrime :: Integral a => a -> Bool
isPrime n = (n>1) && iter divs
    where
      iter (x:xs)
        | x*x > n      = True
        | rem n x == 0 = False
        | otherwise    = iter xs



squareRoot :: Integer -> Integer
squareRoot 0 = 0
squareRoot 1 = 1
squareRoot n = head $ dropWhile (not . isRoot) iters
    where
      twopows = iterate (^2) 2
      (lowerRoot, lowerN) =
        last $ takeWhile ((n>=).snd) $ zip (1:twopows) twopows
      newtonStep x = div (x + div n x) 2
      iters = iterate newtonStep (squareRoot (div n lowerN) * lowerRoot)
      isRoot r = r^2 <= n && n < (r+1)^2

