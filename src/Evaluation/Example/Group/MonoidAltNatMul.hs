module Evaluation.Example.Group.MonoidNatAdd where

import Evaluation.Data

instance Monoid Nat where
    mempty  = Succ One
    mappend = natMul
