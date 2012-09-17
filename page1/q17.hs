module Main where

letters 0 = 0
letters 1 = length "one"
letters 2 = length "two"
letters 3 = length "three"
letters 4 = length "four"
letters 5 = length "five"
letters 6 = length "six"
letters 7 = length "seven"
letters 8 = length "eight"
letters 9 = length "nine"
letters 10 = length "ten"
letters 11 = length "eleven"
letters 12 = length "twelve"
letters 13 = length "thirteen"
letters 14 = length "fourteen"
letters 15 = length "fifteen"
letters 16 = length "sixteen"
letters 17 = length "seventeen"
letters 18 = length "eighteen"
letters 19 = length "nineteen"

letters 20 = length "twenty"
letters 30 = length "thirty"
letters 40 = length "forty"
letters 50 = length "fifty"
letters 60 = length "sixty"
letters 70 = length "seventy"
letters 80 = length "eighty"
letters 90 = length "ninety"

letters 100 = length "hundred"
letters 1000 = letters 1 + length "thousand"

letters n | n >= 100 = letters (n `div` 100) + letters 100 + rest (n `mod` 100)
          | n >= 20  = letters ((n `div` 10) * 10) + letters (n `mod` 10)
             where
               rest 0 = 0
               rest n = length "and" + letters n


main = print $ foldl (+) 0 $ map letters [1..1000]

