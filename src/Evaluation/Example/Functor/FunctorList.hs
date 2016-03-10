module Evaluation.Example.Functor.FunctorList where

import Evaluation.Functor
import Evaluation.List
import Prelude hiding (Functor(..))

instance Functor List where
    fmap f Empty = Empty
    fmap f (Cons a as) = Cons (f a) $ fmap f as
