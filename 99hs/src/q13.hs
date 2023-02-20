module Q13(lengthEncodeDirect) where

import Test.QuickCheck

lengthEncodeDirect :: Eq a => [a] -> [EncodeResult a]
lengthEncodeDirect xs = [ if length x > 1 then Multiple (length x) (head x) else Single (head x) | x <- (myPack xs) ]