module Q18(slice) where

slice :: [a] -> Int -> Int -> [a]
slice xs start end
    | end > length xs   = error "Slice cannot end after final index!"
    | start < 0         = error "Slice cannot start at index less than zero!"
    | otherwise         = drop (start-1) (take end xs)