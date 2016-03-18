module Evaluation.Example.Group.MonoidNatAdd where

import Tip
import Evaluation.Data
import Evaluation.Semigroup
import Evaluation.MonoidAlt
import Evaluation.Example.Ring.SemiringNat
import Prelude hiding (Monoid(..))

-- TODO: Use built-in monoid
instance Monoid Nat where
    mempty  = Zero
    mappend = natAdd
