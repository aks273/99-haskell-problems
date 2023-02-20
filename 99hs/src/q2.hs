module Q2(myButLast, prop_myButLast) where

import Test.QuickCheck

myButLast :: [a] -> a
myButLast [] = error "No second to last element of empty list!"
myButLast [x] = error "No second to last element of list of length 1!"
myButLast (x:xs) = if length xs > 1 then myButLast xs else x

prop_myButLast :: Eq a => [a] -> Property
prop_myButLast xs =
    (length xs > 1) ==>
    myButLast xs == xs !! ( (length xs) - 2 )