import Test.QuickCheck

import Q1 (prop_myLast)
import Q2 (prop_myButLast)

main :: IO ()
main = do
    -- These tests currently work when loading q1.hs or q2.hs into ghci and running
    -- `quickCheck` from there.

    -- However, these tests don't work when running `stack test`, with the following error:

    --     /Users/akhilshah/Documents/haskell/99-haskell-problems/99hs/test/Spec.hs:9:5: error:
    --     • Ambiguous type variable ‘a1’ arising from a use of ‘quickCheck’
    --       prevents the constraint ‘(Arbitrary a1)’ from being solved.
    --       Probable fix: use a type annotation to specify what ‘a1’ should be.
    --       These potential instances exist:
    --         instance (Arbitrary a, Arbitrary b) => Arbitrary (Either a b)
    --           -- Defined in ‘Test.QuickCheck.Arbitrary’
    --         instance Arbitrary Ordering
    --           -- Defined in ‘Test.QuickCheck.Arbitrary’
    --         instance Arbitrary a => Arbitrary (Maybe a)
    --           -- Defined in ‘Test.QuickCheck.Arbitrary’
    --         ...plus 19 others
    --         ...plus 62 instances involving out-of-scope types
    --         (use -fprint-potential-instances to see them all)
    --     • In a stmt of a 'do' block: quickCheck prop_myButLast
    --       In the expression:
    --         do quickCheck prop_myLast
    --            quickCheck prop_myButLast
    --            putStrLn "tests done!"
    --       In an equation for ‘main’:
    --           main
    --             = do quickCheck prop_myLast
    --                  quickCheck prop_myButLast
    --                  putStrLn "tests done!"
    --   |
    -- 9 |     quickCheck prop_myButLast


    -- They do however work when we remove the `Eq a` constraint and change `a` to
    -- a type that already satisfies this constraint, e.g. and Int. I'm not sure why
    -- atm.

    quickCheck prop_myLast
    quickCheck prop_myButLast
    putStrLn "tests done!"
