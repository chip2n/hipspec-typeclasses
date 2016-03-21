module Evaluation.Example.Group.MonoidNatAdd where

import Evaluation.Data
import Evaluation.Monoid
import Evaluation.Example.Group.SemigroupNatAdd
import Prelude hiding (Monoid(..))

-- Uses semigroup instance for Nat with addition
instance Monoid Nat where
    identity = Zero
