import Test.QuickCheck

import Q1 (prop_myLast)
import Q2 (prop_myButLast)
import Q10_13 (prop_lengthEncode)
import Q23 (prop_rndSelect)
import Q26 (prop_combinations)

main :: IO ()
main = do
    -- When using quickCheck, we must cast the arguments of a function, if any of
    -- them are typeclass arguments
    -- (see https://stackoverflow.com/questions/10037923/haskell-quickcheck-best-practices-especially-when-testing-type-classes)

    quickCheck (prop_myLast :: [Int] -> Property)
    quickCheck (prop_myLast :: String -> Property)
    quickCheck (prop_myLast :: [String] -> Property)

    quickCheck (prop_myButLast :: [Int] -> Property)
    quickCheck (prop_myButLast :: String -> Property)
    quickCheck (prop_myButLast :: [String] -> Property)

    quickCheck (prop_lengthEncode :: [Int] -> Bool)
    quickCheck (prop_lengthEncode :: String -> Bool)
    quickCheck (prop_lengthEncode :: [String] -> Bool)

    quickCheck (prop_rndSelect :: [Int] -> Int -> Property)
    quickCheck (prop_rndSelect :: String -> Int -> Property)
    quickCheck (prop_rndSelect :: [String] -> Int -> Property)

    quickCheck (prop_combinations :: Int -> [Int] -> Property)
    quickCheck (prop_combinations :: Int -> String -> Property)
    quickCheck (prop_combinations :: Int -> [String] -> Property)


    putStrLn "tests done!"
