module Q6(isPalindrome) where

import Test.QuickCheck
import Q1(myLast)

isPalindrome :: Eq a => [a] -> Bool
isPalindrome [] = True
isPalindrome [x] = True
isPalindrome (x:xs) = if myLast xs == x
    then isPalindrome (init xs)
    else False