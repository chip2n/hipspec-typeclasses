module Evaluation.Example.Group.SemigroupNatMul where

import Tip
import Evaluation.Data
import Evaluation.Semigroup
import Evaluation.Example.Ring.SemiringNat

-- TODO: Includes natAdd in generated TIP code
instance Semigroup Nat where
    op = natMul
