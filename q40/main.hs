module Main where

split :: Integral a => a -> [a]
split n
    | n == 0 = []
    | otherwise = q : split r
        where
          (r, q) = divMod n 10

main = do
    let xs = [0..]
    let s = concatMap show xs
    let ds = map (s!!) [1,10,100,1000,10000,100000,1000000]
    let ys = split $ read ds
    print $ foldr (*) 1 ys
