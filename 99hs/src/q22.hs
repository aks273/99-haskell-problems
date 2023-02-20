module Q22(range) where

import Test.QuickCheck

range :: Int -> Int -> [Int]
range a b = [a..b]