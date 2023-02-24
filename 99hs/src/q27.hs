module Q27(group) where

import Data.Set

-- All combinations of n strings that can be selected from the list, with the strings not chosen
-- saved
combination :: Int -> [String] -> [([String], [String])]
combination 0 xs = [([], xs)]
combination _ [] = []
combination n (x:xs) = dsf ++ nsf
    where
        dsf = [ (x:ys, zs) | (ys,zs) <- combination (n-1) xs ]  -- did select first el
        nsf = [ (ys, x:zs) | (ys,zs) <- combination n xs ]      -- not select first el

group :: [Int] -> Set String -> [[[String]]]
group [] _ = [[]]
group nsList xsSet
    | sumList nsList /= length xs   = error "Lengths of groups must add up to length of set"
    | otherwise                     = [ g:gs | (g,rs) <- combination n xs, gs <- group ns (fromList rs) ]
        where
            xs = toList xsSet
            n = head nsList
            ns = tail nsList

sumList :: [Int] -> Int
sumList [] = 0
sumList [x] = x
sumList (x:xs) = x + sumList xs