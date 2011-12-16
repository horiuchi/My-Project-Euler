module Main where

main = print $ ead $ drop 999999 $ sort $ permutations [0,1,2,3,4,5,6,7,8,9]
