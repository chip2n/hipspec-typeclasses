module NatMul where

import Tip

data NatMul = One | Succ NatMul

instance Monoid NatMul where
  mempty = One
  mappend One a = a
  mappend (Succ a) b = add b (mappend a b)
    where
      add One a = Succ a
      add (Succ a) b = Succ (add a b)

