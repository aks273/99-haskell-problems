module Q12(lengthDecodeModified) where

import Test.QuickCheck

lengthDecodeModified :: [EncodeResult a] -> [a]
lengthDecodeModified [] = []
lengthDecodeModified ((Single x):xs) = x : lengthDecodeModified xs
lengthDecodeModified ((Multiple n x):xs) = (replicate n x) ++ lengthDecodeModified xs