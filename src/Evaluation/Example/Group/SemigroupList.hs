module Evaluation.Example.Group.SemigroupList where

import Evaluation.Data
import Evaluation.Semigroup

instance Semigroup (List a) where
    Empty       `op` a = a
    (Cons a as) `op` bs = Cons a (as `op` bs)
