module Q15(repli) where

import Test.QuickCheck

repli :: [a] -> Int -> [a]
repli [] n = if n < 0
    then error "Cannot replicate each element a negative number of times!"
    else []
repli (x:xs) n = if n < 0
    then error "Cannot replicate each element a negative number of times!"
    else replicate n x ++ repli xs n