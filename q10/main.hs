module Main where

import Prime

main = print $ foldr (+) 0 $ primes_below 2000000

