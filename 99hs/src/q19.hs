module Q19(rotate) where

rotate :: [a] -> Int -> [a]
rotate xs index =
    let rotateIndex = mod index (length xs)
    in (drop rotateIndex xs) ++ (take rotateIndex xs)