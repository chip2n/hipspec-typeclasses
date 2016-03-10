module Evaluation.Example.Ring.SemiringNat where

import Tip
import Evaluation.Nat
import Evaluation.Semiring

instance Semiring Nat where
    zero = Zero
    one  = Succ Zero
    add  = natAdd
    mul  = natMul
