module Q21(insertAt) where

import Test.QuickCheck

insertAt :: a -> [a] -> Int -> [a]
insertAt new xs index
    | index < 0 || index > length xs    = error "Cannot insert at undefined list index!"
    | otherwise                         = (take index xs) ++ [new] ++ (drop index xs)