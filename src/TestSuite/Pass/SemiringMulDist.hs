module Semiring where

import Tip

class Semiring a where
  add :: a -> a -> a
  mul :: a -> a -> a

data Nat = Zero | Succ Nat
  deriving Eq
  -- deriving (Eq, Show)

instance Semiring Nat where
  add n Zero = n
  add n (Succ m) = Succ $ add n m
  mul n Zero = Zero
  mul n (Succ m) = add n $ mul n m

mulDistributive :: Semiring a => a -> a -> a -> Equality a
mulDistributive a b c = mul a (add b c) === add (mul a b) (mul a c)

