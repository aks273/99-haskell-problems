module Q28 (lsort, lfsort) where

import Data.Function
import Data.List (sortBy)

-- sort by length
lsort :: [[a]] -> [[a]]
lsort xs = sortBy (compare `on` length) xs

-- pack by length frequency
lfpack :: [[a]] -> [[[a]]]
lfpack [] = []
lfpack (x:xs) = if length x == (length . head) xs
    then (x : head (lfpack xs)) : tail (lfpack xs)
    else [x] : lfpack xs

-- sort by length frequency
lfsort :: [[a]] -> [[a]]
lfsort [] = []
lfsort xs = foldr (++) [] (sortBy (compare `on` length) ((lfpack . lsort) xs))