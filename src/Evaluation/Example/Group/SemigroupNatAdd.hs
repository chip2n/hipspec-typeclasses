module Evaluation.Example.Group.SemigroupNatAdd where

import Tip
import Evaluation.Data
import Evaluation.Semigroup
import Evaluation.Example.Ring.SemiringNat (natAdd)

instance Semigroup Nat where
    op = natAdd
