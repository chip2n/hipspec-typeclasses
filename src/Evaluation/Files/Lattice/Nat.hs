module Nat where

data Nat = Zero | Succ Nat

natAdd :: Nat -> Nat -> Nat
natAdd Zero a     = a
natAdd (Succ a) b = Succ (natAdd a b)

natMul :: Nat -> Nat -> Nat
natMul (Succ n) m = natAdd m (natMul n m)
natMul Zero m = Zero
