module Main where

main = do
    let total = sum $ map (\x->x^x) [1..1000]
    print $ mod total 10000000000
