module Evaluation.Nat where

data Nat = Zero | Succ Nat

-- Natural numbers addition
natAdd :: Nat -> Nat -> Nat
natAdd Zero a     = a
natAdd (Succ a) b = Succ (natAdd a b)

-- Natural numbers multiplication
natMul :: Nat -> Nat -> Nat
natMul (Succ n) m = natAdd m (natMul n m)
natMul Zero m = Zero
