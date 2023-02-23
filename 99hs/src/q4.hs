module Q4(myLength) where

myLength :: [a] -> Int
myLength [] = 0
myLength [_] = 1;
myLength (_:xs) = 1 + myLength xs