module Evaluation.Semigroup where

import Tip

class Semigroup a where
    op :: a -> a -> a

lawSemigroupAssoc :: Semigroup a => a -> a -> a -> Equality a
lawSemigroupAssoc a b c = (a `op` b) `op` c === a `op` (b `op` c)
