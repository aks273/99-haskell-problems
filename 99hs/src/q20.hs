module Q20(
removeAt) where

import Test.QuickCheck


removeAt :: [a] -> Int -> (a, [a])
removeAt xs index
    | index > length xs || index <= 0   = error "Cannot remove at undefined list element!"
    | otherwise                         = (xs !! (index-1), (take (index-1) xs) ++ (drop index xs))