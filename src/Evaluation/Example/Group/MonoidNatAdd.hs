module Evaluation.Example.Group.MonoidNatAdd where

import Tip
import Evaluation.Nat
import Evaluation.Semigroup
import Evaluation.Monoid
import Prelude hiding (Monoid(..))

instance Semigroup Nat where
    op = natAdd

instance Monoid Nat where
    identity = Zero
