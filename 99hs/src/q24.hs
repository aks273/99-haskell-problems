module Q24(diffSelect) where

import System.Random

diffSelect :: Int -> Int -> [Int]
diffSelect n m
    | n < 0 || m < 0 = error "Please provide positive arguments for diffSelect!"
    | otherwise = take n [ x | x <- randomRs (0, m) (mkStdGen m) ]