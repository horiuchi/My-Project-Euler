module Main where

import qualified Char

main = print $ foldr (+) 0 $ map Char.digitToInt $ show(2^1000)

