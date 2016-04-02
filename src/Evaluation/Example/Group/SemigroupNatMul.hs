module Evaluation.Example.Group.SemigroupNatMul where

import Tip
import Evaluation.Data
import Evaluation.Semigroup
import Evaluation.Example.Ring.SemiringNat

instance Semigroup Nat where
    op = natMul
