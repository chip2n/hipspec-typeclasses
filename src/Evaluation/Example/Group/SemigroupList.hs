module Evaluation.Example.Group.SemigroupList where

import Evaluation.List
import Evaluation.Semigroup

instance Semigroup (List a) where
    Empty       `op` a = a
    (Cons a as) `op` b = Cons a (as `op` b)
