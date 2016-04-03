module Evaluation.Example.Group.SemigroupNatMul where

import Tip
import Evaluation.Data
import Evaluation.Semigroup

instance Semigroup Nat where
    op = natMul

-- Natural numbers multiplication
natMul :: Nat -> Nat -> Nat
natMul Zero m     = Zero
natMul (Succ n) m = natAdd m (natMul n m)

-- Natural numbers addition
natAdd :: Nat -> Nat -> Nat
natAdd Zero a     = a
natAdd (Succ a) b = Succ (natAdd a b)
