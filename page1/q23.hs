module Main where

import Data.Map (Map, fromList, lookup)

isAbd :: Int -> Bool
isAbd n = n < abd n
    where
      abd n = sum $ filter ((==0).(mod n)) [1..n-1]

abds :: Int -> [Int]
abds n = filter isAbd [1..n]

make_abd_map :: [Int] -> Map Int Bool
make_abd_map xs = fromList $ zip xs $ repeat True

is_sum_of_two :: Map Int Bool -> Int -> Bool
is_sum_of_two map n = check map n [1..(div n 2)]
    where
      check map n [] = False
      check map n (x:xs) = 
          if is_just_true (Data.Map.lookup x map)
             && is_just_true (Data.Map.lookup (n-x) map) 
          then True
          else check map n xs
        where
          is_just_true (Just True) = True
          is_just_true _ = False

main = do
    let n = 28123
    let l = abds n
    let map = make_abd_map l
    print $ sum $ filter (not.is_sum_of_two map) $ [1..n]
