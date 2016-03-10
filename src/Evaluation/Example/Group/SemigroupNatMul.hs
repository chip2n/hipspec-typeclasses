module Evaluation.Example.Group.SemigroupNatMul where

import Tip
import Evaluation.Nat
import Evaluation.Semigroup

instance Semigroup Nat where
    op = natMul
