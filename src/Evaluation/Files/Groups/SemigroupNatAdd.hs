module SemigroupNatAdd where

import Tip
import Nat
import Semigroup

instance Semigroup Nat where
    op = natAdd

lawSemigroupAssoc :: Semigroup a => a -> a -> a -> Equality a
lawSemigroupAssoc a b c = (a `op` b) `op` c === a `op` (b `op` c)
