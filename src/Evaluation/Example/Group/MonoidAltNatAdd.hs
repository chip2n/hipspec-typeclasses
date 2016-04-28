module Evaluation.Example.Group.MonoidAltNatAdd where

import Evaluation.Data

instance Monoid Nat where
    mempty  = Zero
    mappend = natAdd

-- Natural numbers addition
natAdd :: Nat -> Nat -> Nat
natAdd Zero a     = a
natAdd (Succ a) b = Succ (natAdd a b)
