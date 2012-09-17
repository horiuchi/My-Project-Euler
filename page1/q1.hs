answer m = sum [n | n <- [1..m-1], n `mod` 5 == 0 || n `mod` 3 == 0]
main = print (answer 1000)

