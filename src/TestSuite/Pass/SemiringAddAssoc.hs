module Semiring where

import Tip

class Semiring a where
  add :: a -> a -> a
  mul :: a -> a -> a

data Nat = Zero | Succ Nat

instance Semiring Nat where
  add n Zero = n
  add n (Succ m) = Succ $ add n m
  mul n Zero = Zero
  mul n (Succ m) = add n $ mul n m

addAssociativity :: Semiring a => a -> a -> a -> Equality a
addAssociativity a b c = add (add a b) c === add a (add b c)

