module Main where

main = do
    let pattern = [[a,b,c,d,e,f]|a<-[0..2],b<-[0..4],c<-[0..10],d<-[0..20],e<-[0..40],f<-[0..100], a*100+b*50+c*20+d*10+e*5+f*2<=200]
    print $ 1 + length pattern
