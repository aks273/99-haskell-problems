module Q7(myFlatten) where

data NestedList a = Elem a | List [NestedList a]
myFlatten :: NestedList a -> [a]
myFlatten (Elem x) = [x]
myFlatten (List []) = []
myFlatten (List [Elem x]) = [x]
myFlatten (List (x:xs)) = myFlatten x ++ myFlatten (List xs)