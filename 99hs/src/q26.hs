module Q26(combinations, prop_combinations) where

import Test.QuickCheck

combinations :: Int -> [a] -> [[a]]
combinations n list
    | n == 0                    = [[]]
    | length list == 0          = []
    | otherwise                 = map (x:) (combinations (n-1) xs) ++ combinations n xs
        where
            x   = head list
            xs  = tail list

factorial :: Int -> Int
factorial n
    | n == 0    = 1
    | otherwise = n * factorial (n - 1)

-- not named regular `choose` to avoid conflict of Test.QuickCheck.choose
combinatoricsChoose :: Int -> Int -> Int
combinatoricsChoose n r
    | r > n     = error "Cannot have a combination of length greater than n"
    | r < 0     = 0
    | r == 0    = 1
    | otherwise = factorial n `div` ((factorial r) * (factorial (n - r)))

prop_combinations :: Int -> [a] -> Property
prop_combinations r xs =
    -- constraining length < 20 because factorial 21 suffers from integer underflow
    length xs > r && length xs < 20 ==>
    length (combinations r xs) == (length xs) `combinatoricsChoose` r