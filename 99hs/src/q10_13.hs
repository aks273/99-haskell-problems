module Q10_13(
    lengthEncode, lengthEncodeModified, lengthDecodeModified, lengthEncodeDirect, prop_lengthEncode
    ) where

import Test.QuickCheck
import Q9(myPack)

lengthEncode :: Eq a => [a] -> [(Int, a)]
lengthEncode xs = [ (length x, head x) | x <- (myPack xs) ]

data EncodeResult a = Single a | Multiple Int a
lengthEncodeModified :: Eq a => [a] -> [EncodeResult a]
lengthEncodeModified xs = map modify (lengthEncode xs)
    where
        modify (1, x) = Single x
        modify (n, x) = Multiple n x

lengthDecodeModified :: [EncodeResult a] -> [a]
lengthDecodeModified [] = []
lengthDecodeModified ((Single x):xs) = x : lengthDecodeModified xs
lengthDecodeModified ((Multiple n x):xs) = (replicate n x) ++ lengthDecodeModified xs

lengthEncodeDirect :: Eq a => [a] -> [EncodeResult a]
lengthEncodeDirect xs = [ if length x > 1 then Multiple (length x) (head x) else Single (head x) | x <- (myPack xs) ]

prop_lengthEncode :: Eq a => [a] -> Bool
prop_lengthEncode xs = xs == (lengthDecodeModified . lengthEncodeModified) xs && xs == (lengthDecodeModified . lengthEncodeDirect) xs