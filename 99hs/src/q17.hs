module Q17(split) where

split :: [a] -> Int -> ([a], [a])
split xs n
    | n < 0         = error "Cannot split at a negative index!"
    | n > length xs = error "Cannot split at index greater than length!"
    | otherwise     = (take n xs, drop n xs)