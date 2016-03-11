module Evaluation.Example.Group.MonoidAltList where

import Evaluation.Data
import Evaluation.MonoidAlt
import Prelude hiding (Monoid(..))

instance Monoid (List a) where
  mempty = Empty
  mappend Empty       a = a
  mappend (Cons a as) b = Cons a (mappend as b)
