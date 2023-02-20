module Q4(myLength) where

import Test.QuickCheck

myLength :: [a] -> Int
myLength [] = 0
myLength [x] = 1;
myLength (_:xs) = 1 + myLength xs