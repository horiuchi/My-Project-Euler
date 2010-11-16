module Main where

sum_of_squares = foldr (+) 0 [x*x|x<-[1..100]]
square_of_sum = (\x->x*x) $ foldr (+) 0 [1..100]

main = print $ square_of_sum - sum_of_squares

