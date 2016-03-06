module SemigroupNatMul where

import Tip
import GroupLike
import NatMul

instance Semigroup Nat

lawSemigroupAssoc :: Semigroup a => a -> a -> a -> Equality a
lawSemigroupAssoc a b c = (a `op` b) `op` c === a `op` (b `op` c)
