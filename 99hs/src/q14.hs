module Q14(dupli) where

import Test.QuickCheck

dupli :: [a] -> [a]
dupli [] = []
dupli (x:xs) = replicate 2 x ++ dupli xs