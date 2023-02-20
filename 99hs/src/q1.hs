module Q1 (prop_myLast) where

import Test.QuickCheck

myLast :: Eq a => [a] -> a
myLast [] = error "No last element of an empty list!"
myLast [x] = x
myLast (_:xs) = myLast xs

prop_myLast :: Eq a => [a] -> Property
prop_myLast xs =
    not (null xs) ==>
    myLast xs == last xs
