module Main where

-- display function (not used)
recuring :: Int -> String
recuring n
      | n <= 0 = error "n is not positive value."
      | n == 1 = "1"
      | d == 0 = "0." ++ s
      | otherwise = "0." ++ take p s ++ "(" ++ drop p s ++ ")"
    where
      p = length s - d
      (s,d) = divide n 1 []

recur_size :: Int -> Int
recur_size n = snd $ divide n 1 []

divide :: Int -> Int -> [Int] -> (String, Int)
divide n m ms
      | m `elem` ms = ([], position m ms)
      | r == 0 = (show q, 0)
      | r /= 0 = (show q ++ s, i)
    where
      (q,r) = quotRem (m*10) n
      (s,i) = divide n r (m:ms)

position n [] = 1
position n (x:xs)
        | n == x = 1
        | otherwise = 1 + position n xs

main = print $ maximum $ zip (map recur_size [3..999]) [3..]
