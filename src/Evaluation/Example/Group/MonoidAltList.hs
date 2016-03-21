module Evaluation.Example.Group.MonoidAltList where

import Evaluation.Data

instance Monoid (List a) where
    mempty = Empty
    mappend Empty       a = a
    mappend (Cons a as) b = Cons a (mappend as b)
