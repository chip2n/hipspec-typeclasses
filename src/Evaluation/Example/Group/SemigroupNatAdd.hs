module Evaluation.Example.Group.SemigroupNatAdd where

import Tip
import Evaluation.Nat
import Evaluation.Semigroup

instance Semigroup Nat where
    op = natAdd
