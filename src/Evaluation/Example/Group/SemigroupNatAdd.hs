module Evaluation.Example.Group.SemigroupNatAdd where

import Tip
import Evaluation.Data
import Evaluation.Semigroup

instance Semigroup Nat where
    op = natAdd

-- Natural numbers addition
natAdd :: Nat -> Nat -> Nat
natAdd Zero a     = a
natAdd (Succ a) b = Succ (natAdd a b)
