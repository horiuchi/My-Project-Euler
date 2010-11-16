module Main where

-- 指定された日付の曜日を算出する(ツェラーの公式)
-- ( yy2 + [ yy2 / 4] + [ yy1 / 4 ] + [(13 * mm + 8 ) / 5 ] - ( 2 * yy1 ) + dd ) mod 7 
zeller :: Int -> Int -> Int -> Int
zeller y m d 
    | ((m == 1) || (m == 2)) = _zeller (y - 1) (m + 12) d
    | otherwise = _zeller y m d

_zeller :: Int -> Int -> Int -> Int
_zeller y m d = let
                  uppery = div y 100
                  lowery = mod y 100
                  y1 = lowery 
                  y2 = div lowery 4
                  y3 = div uppery 4
                  y4 = uppery * 2
                  m1 = div (13 * m + 8) 5
                  d1 = d
                in mod (y1 + y2 + y3 + m1 - y4 + d1) 7

main = print $ length $ filter (==0) $ [zeller y m 1 | y<-[1901..2000], m<-[1..12]]

