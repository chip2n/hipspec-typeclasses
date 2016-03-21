module Evaluation.Example.Group.MonoidNatMul where

import Evaluation.Data
import Evaluation.Monoid
import Evaluation.Example.Group.SemigroupNatMul
import Prelude hiding (Monoid(..))

-- Uses semigroup instance for Nat with multiplication
instance Monoid Nat where
    identity = Succ Zero
