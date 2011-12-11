module Main where

import Data.Char
import Data.List
import Text.Regex

splitLine :: String -> [String]
splitLine = tail . splitRegex (mkRegex "\"|\",\"")

calcOrder :: String -> Int
calcOrder = sum . map fromChar

fromChar :: Char -> Int
fromChar = flip (-) (fromEnum 'A' - 1) . fromEnum

main = do
    line <- readFile "names.txt"
    let scores = map calcOrder $ tail $ sort $ splitLine line
    -- print $ zip [1..] $ zip scores $ tail $ sort $ splitLine line
    print $ sum $ map (uncurry (*)) $ zip [1..] scores
