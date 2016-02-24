module NatMul where

data Nat = One | Succ Nat

instance Monoid Nat where
  mempty = One
  mappend  One     a = a
  mappend (Succ a) b = add b (mappend a b)
    where add One a = Succ a
          add (Succ a) b = Succ (add a b)
