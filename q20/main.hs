module Main where

import Char

fact 1 = 1
fact n = n * fact (n-1)

main = print $ foldr (+) 0 $ map Char.digitToInt $ show $ fact 100

