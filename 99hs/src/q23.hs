module Q23(rndSelect, prop_rndSelect) where

import System.Random
import Test.QuickCheck
import Data.Set(fromList, toList)

import Q9(myPack)

rndSelect :: Eq a => [a] -> Int -> [a]
rndSelect xs n
    | length xs < n = error "Cannot pick more numbers than there are in the list!"
    | n < 0         = error "Cannot pick a negative indexed number from the list!"
    | n == 0        = []
    | otherwise     =
        let (index, _)    = (randomR (0, (length xs) - 1) (mkStdGen n))
            el              = xs !! index
        in [ el ] ++ (filter (\x -> x /= el) xs) `rndSelect` (n - 1)

prop_rndSelect :: Ord a => [a] -> Int -> Property
prop_rndSelect xs n
    | otherwise =
        (n > 0 && length uniqueXs >= n) ==>
        (length . myPack) rands == length rands
    where
        uniqueXs = (toList . fromList) xs
        rands = rndSelect uniqueXs n
