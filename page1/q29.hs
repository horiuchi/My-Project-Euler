module Main where

import qualified Data.Set as Set

uniq :: [Integer] -> [Integer]
uniq = f Set.empty
    where
      f _ []     = []
      f s (x:xs) | Set.member x s = f s xs
                 | otherwise      = x : f (Set.insert x s) xs

main = print $ length $ uniq [a^b|a<-[2..100], b<-[2..100]]
