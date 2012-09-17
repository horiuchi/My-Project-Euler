module Main where

import Control.Monad

-- pattern = [[a,b,c,d,e,f]|a<-[0..2],b<-[0..4],c<-[0..10],d<-[0..20],e<-[0..40],f<-[0..100], a*100+b*50+c*20+d*10+e*5+f*2<=200]
pattern = do
    a <- [0..2]
    b <- [0..4]
    c <- [0..10]
    d <- [0..20]
    e <- [0..40]
    f <- [0..100]
    guard $ a*100+b*50+c*20+d*10+e*5+f*2 <= 200
    return [a,b,c,d,e,f]

main = print $ 1 + length pattern
