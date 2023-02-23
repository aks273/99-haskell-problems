module Q9(myPack) where

myPack :: Eq a => [a] -> [[a]]
myPack [] = []
myPack [x] = [[x]]
myPack (x:xs) = if x `elem` head (myPack xs)
    then (x : head (myPack xs)) : tail (myPack xs)
    else [x] : myPack xs