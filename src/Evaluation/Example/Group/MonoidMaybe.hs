module Evaluation.Example.Group.MonoidMaybe where

import Evaluation.Data
import Evaluation.Monoid
import Evaluation.Semigroup
import Evaluation.Example.Group.SemigroupMaybe
import Prelude hiding (Monoid(..))

instance Semigroup a => Monoid (Maybe a) where
  identity = Nothing
