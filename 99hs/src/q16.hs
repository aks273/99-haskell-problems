module Q16(dropEvery) where

dropEvery :: [a] -> Int -> [a]
dropEvery [] n = if n < 0
    then error "Cannot drop elements with negative indices!"
    else []
dropEvery xs n = if n < 0
    then error "Cannot drop elements with negative indices!"
    else take (n-1) xs ++ dropEvery (drop n xs) n