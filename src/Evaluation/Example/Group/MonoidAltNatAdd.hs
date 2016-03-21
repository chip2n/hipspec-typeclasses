module Evaluation.Example.Group.MonoidNatAdd where

import Tip
import Evaluation.Data
import Evaluation.Semigroup
import Evaluation.Example.Ring.SemiringNat

instance Monoid Nat where
    mempty  = Zero
    mappend = natAdd
