module Evaluation.Example.Group.MonoidNatAdd where

import Evaluation.Data
import Evaluation.Example.Group.SemigroupNatMul (natMul)

instance Monoid Nat where
    mempty  = Succ Zero
    mappend = natMul
