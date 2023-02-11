myLast :: [a] -> a
myLast [] = error "No last element of an empty list!"
myLast [x] = x
myLast (_:xs) = myLast xs

myButLast :: [a] -> a
myButLast [] = error "No second to last element of empty list!"
myButLast [x] = error "No second to last element of list of length 1!"
myButLast (x:xs) = if length xs > 1 then myButLast xs else x

elementAt :: [a] -> (Int -> a)
elementAt list n = if length list < n
    then error "Element index is too large for list!"
    else list !! ( n - 1 )

myLength :: [a] -> Int
myLength [] = 0
myLength [x] = 1;
myLength (_:xs) = 1 + myLength xs

myReverse :: [a] -> [a]
myReverse [] = []
myReverse [x] = [x]
myReverse (x:xs) = myReverse xs ++ [x]

isPalindrome :: Eq a => [a] -> Bool
isPalindrome [] = True
isPalindrome [x] = True
isPalindrome (x:xs) = if myLast xs == x
    then isPalindrome (init xs)
    else False

data NestedList a = Elem a | List [NestedList a]
myFlatten :: NestedList a -> [a]
myFlatten (Elem x) = [x]
myFlatten (List []) = []
myFlatten (List [Elem x]) = [x]
myFlatten (List (x:xs)) = myFlatten x ++ myFlatten (List xs)

myCompress :: Eq a => [a] -> [a]
myCompress [] = []
myCompress [x] = [x]
myCompress (x:xs) = if x == xs !! 0
    then myCompress (x : tail xs)
    else x : myCompress (xs)

myPack :: Eq a => [a] -> [[a]]
myPack [] = []
myPack [x] = [[x]]
myPack (x:xs) = if x `elem` head (myPack xs)
    then (x : head (myPack xs)) : tail (myPack xs)
    else [x] : myPack xs

lengthEncode :: Eq a => [a] -> [(Int, a)]
lengthEncode xs = [ (length x, head x) | x <- (myPack xs) ]

data EncodeResult a = Single a | Multiple Int a
lengthEncodeModified :: Eq a => [a] -> [EncodeResult a]
lengthEncodeModified xs = map modify (lengthEncode xs)
    where
        modify (1, x) = Single x
        modify (n, x) = Multiple n x

lengthDecodeModified :: [EncodeResult a] -> [a]
lengthDecodeModified [] = []
lengthDecodeModified ((Single x):xs) = x : lengthDecodeModified xs
lengthDecodeModified ((Multiple n x):xs) = (replicate n x) ++ lengthDecodeModified xs

lengthEncodeDirect :: Eq a => [a] -> [EncodeResult a]
lengthEncodeDirect xs = [ if length x > 1 then Multiple (length x) (head x) else Single (head x) | x <- (myPack xs) ]

dupli :: [a] -> [a]
dupli [] = []
dupli (x:xs) = replicate 2 x ++ dupli xs

repli :: [a] -> Int -> [a]
repli [] n = if n < 0
    then error "Cannot replicate each element a negative number of times!"
    else []
repli (x:xs) n = if n < 0
    then error "Cannot replicate each element a negative number of times!"
    else replicate n x ++ repli xs n

dropEvery :: [a] -> Int -> [a]
dropEvery [] n = if n < 0
    then error "Cannot drop elements with negative indices!"
    else []
dropEvery xs n = if n < 0
    then error "Cannot drop elements with negative indices!"
    else take (n-1) xs ++ dropEvery (drop n xs) n

split :: [a] -> Int -> ([a], [a])
split xs n
    | n < 0         = error "Cannot split at a negative index!"
    | n > length xs = error "Cannot split at index greater than length!"
    | otherwise     = (take n xs, drop n xs)

slice :: [a] -> Int -> Int -> [a]
slice xs start end
    | end > length xs   = error "Slice cannot end after final index!"
    | start < 0         = error "Slice cannot start at index less than zero!"
    | otherwise         = drop (start-1) (take end xs)

rotate :: [a] -> Int -> [a]
rotate xs index =
    let rotateIndex = mod index (length xs)
    in (drop rotateIndex xs) ++ (take rotateIndex xs)


removeAt :: [a] -> Int -> (a, [a])
removeAt xs index
    | index > length xs || index <= 0   = error "Cannot remove at undefined list element!"
    | otherwise                         = (xs !! (index-1), (take (index-1) xs) ++ (drop index xs))

insertAt :: a -> [a] -> Int -> [a]
insertAt new xs index
    | index < 0 || index > length xs    = error "Cannot insert at undefined list index!"
    | otherwise                         = (take index xs) ++ [new] ++ (drop index xs)

range :: Int -> Int -> [Int]
range a b = [a..b]