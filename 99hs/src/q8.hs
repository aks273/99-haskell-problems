module Q8(myCompress) where

import Test.QuickCheck

myCompress :: Eq a => [a] -> [a]
myCompress [] = []
myCompress [x] = [x]
myCompress (x:xs) = if x == xs !! 0
    then myCompress (x : tail xs)
    else x : myCompress (xs)