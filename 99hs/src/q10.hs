module Q10(lengthEncode) where

import Test.QuickCheck

lengthEncode :: Eq a => [a] -> [(Int, a)]
lengthEncode xs = [ (length x, head x) | x <- (myPack xs) ]