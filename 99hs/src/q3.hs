module Q3(elementAt) where

elementAt :: [a] -> (Int -> a)
elementAt list n = if length list < n
    then error "Element index is too large for list!"
    else list !! ( n - 1 )