module Semiring where

import Tip

class SemiRing a where
  add :: a -> a -> a
  mul :: a -> a -> a

data Nat = Zero | Succ Nat
  deriving Eq

instance SemiRing Nat where
  add n Zero = n
  add n (Succ m) = Succ $ add n m
  mul n m = Zero

law :: SemiRing a => a -> a -> Equality a
law n m = (add m n) === (add n m)
