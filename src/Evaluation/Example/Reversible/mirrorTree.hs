module NaiveReverseList where

import Tip
import Prelude hiding ((++))

data Tree a = Leaf a | Branch (Tree a) (Tree a)

class Reversible a where
  rev :: a -> a

mirror :: Tree a -> Tree a
mirror (Leaf a) = Leaf a
mirror (Branch left right) = Branch (mirror right) (mirror left)

instance Reversible (Tree a) where
  rev = mirror

reverseLaw :: Reversible a => a -> Equality a
reverseLaw xs = rev (rev xs) === xs

