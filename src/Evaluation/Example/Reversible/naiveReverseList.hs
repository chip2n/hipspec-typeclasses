module NaiveReverseList where

import Tip
import Prelude hiding ((++))

class Reversible a where
  rev :: a -> a

(++) :: [a] -> [a] -> [a]
(++) [] ys = ys
(++) (x:xs) ys = x : xs ++ ys

naiverev :: [a] -> [a]
naiverev [] = []
naiverev (x:xs) = naiverev xs ++ [x]

instance Reversible [a] where
  rev = naiverev

reverseLaw :: Reversible a => a -> Equality a
reverseLaw xs = rev (rev xs) === xs

