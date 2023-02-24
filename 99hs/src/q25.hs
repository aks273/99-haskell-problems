module Q25(randomPermu) where

import Q23(rndSelect)

randomPermu :: Eq a => [a] -> [a]
randomPermu xs = rndSelect xs (length xs)