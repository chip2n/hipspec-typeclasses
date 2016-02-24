module NatAdd where

data Nat = Zero | Succ Nat

instance Monoid Nat where
  mempty = Zero
  mappend  Zero    a = a
  mappend (Succ a) b = Succ (mappend a b)
