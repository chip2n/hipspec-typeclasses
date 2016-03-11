module Evaluation.Example.Group.MonoidNatAdd where

import Tip
import Evaluation.Data
import Evaluation.Semigroup
import Evaluation.Monoid
import Evaluation.Example.Ring.SemiringNat
import Prelude hiding (Monoid(..))

instance Semigroup Nat where
    op = natAdd

instance Monoid Nat where
    identity = Zero
