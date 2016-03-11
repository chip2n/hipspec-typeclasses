module Evaluation.Example.Group.MonoidList where

import Evaluation.Data
import Evaluation.Monoid
import Evaluation.Example.Group.SemigroupList
import Prelude hiding (Monoid(..))

instance Monoid (List a) where
    identity = Empty
