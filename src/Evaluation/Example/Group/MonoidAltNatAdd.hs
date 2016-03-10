module Evaluation.Example.Group.MonoidNatAdd where

import Tip
import Evaluation.Nat
import Evaluation.Semigroup
import Evaluation.MonoidAlt
import Prelude hiding (Monoid(..))

instance Monoid Nat where
    mempty = Zero
    mappend = natAdd
