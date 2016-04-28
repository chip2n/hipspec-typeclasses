module Evaluation.Example.Group.MonoidNatAdd where

import Evaluation.Data

instance Monoid Nat where
    mempty  = Succ Zero
    mappend = natMul

-- Natural numbers multiplication
natMul :: Nat -> Nat -> Nat
natMul Zero m     = Zero
natMul (Succ n) m = natAdd m (natMul n m)

-- Natural numbers addition
natAdd :: Nat -> Nat -> Nat
natAdd Zero a     = a
natAdd (Succ a) b = Succ (natAdd a b)
