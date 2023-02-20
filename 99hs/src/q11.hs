module Q11(data) where

import Test.QuickCheck

data EncodeResult a = Single a | Multiple Int a
lengthEncodeModified :: Eq a => [a] -> [EncodeResult a]
lengthEncodeModified xs = map modify (lengthEncode xs)
    where
        modify (1, x) = Single x
        modify (n, x) = Multiple n x