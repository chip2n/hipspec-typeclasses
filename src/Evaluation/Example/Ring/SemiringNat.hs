module Evaluation.Example.Ring.SemiringNat where

import Tip
import Evaluation.Data
import Evaluation.Semiring

instance Semiring Nat where
    zero = Zero
    one  = Succ Zero
    add  = natAdd
    mul  = natMul

-- Natural numbers addition
natAdd :: Nat -> Nat -> Nat
natAdd Zero a     = a
natAdd (Succ a) b = Succ (natAdd a b)

-- Natural numbers multiplication
natMul :: Nat -> Nat -> Nat
natMul Zero m     = Zero
natMul (Succ n) m = natAdd m (natMul n m)
