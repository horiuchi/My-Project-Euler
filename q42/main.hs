module Main where

import Data.Char
import Data.List
import Text.Regex

splitLine :: String -> [String]
splitLine = tail . splitRegex (mkRegex "\"|\",\"")

fromChar :: Char -> Int
fromChar = flip (-) (fromEnum 'A' - 1) . fromEnum

calcOrder :: String -> Int
calcOrder = sum . map fromChar

triangle :: Integral a => a -> a
triangle n = flip div 2 $ n * (n+1)

isTriangleNum :: Int -> Bool
isTriangleNum n
    | n < 1 = False
    | n == 1 = True
    | otherwise = n == triangle m
        where
          m = floor $ (toEnum (n*2)) ** 0.5

main = do
    line <- readFile "words.txt"
    let words = map calcOrder $ splitLine line
    let ps = filter isTriangleNum words
    print ps
    print $ length ps
