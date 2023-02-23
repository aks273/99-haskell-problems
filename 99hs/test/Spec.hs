import Test.QuickCheck

import Q1 (prop_myLast)
import Q2 (prop_myButLast)

main :: IO ()
main = do
    -- When using quickCheck, we must cast the arguments of a function, if any of
    -- them are typeclass arguments
    -- (see https://stackoverflow.com/questions/10037923/haskell-quickcheck-best-practices-especially-when-testing-type-classes)

    quickCheck (prop_myLast :: [Int] -> Property)
    quickCheck (prop_myLast :: String -> Property)

    quickCheck (prop_myButLast :: [Int] -> Property)
    quickCheck (prop_myButLast :: String -> Property)

    putStrLn "tests done!"
