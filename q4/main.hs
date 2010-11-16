module Main where

is_palindromic x = show x == (reverse $ show x)

nums = reverse [900..999]
find = foldr max 0 $ filter is_palindromic [x*y | x <- nums, y <- nums]
main = print find

