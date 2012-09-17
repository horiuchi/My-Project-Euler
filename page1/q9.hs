module Main where

answer = head [(x,y,z)|x<-[1..999],y<-[x+1..999],z<-[y+1..999], x+y+z==1000, x*x+y*y==z*z]
main = print $ (\(x,y,z) -> x*y*z) answer

