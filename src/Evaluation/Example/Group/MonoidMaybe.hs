module Evaluation.Example.Group.MonoidMaybe where

import Evaluation.Data
import Prelude hiding (Maybe(..))

data Maybe a = Nothing | Just a

instance Monoid a => Monoid (Maybe a) where
  mempty = Nothing
  mappend Nothing m = m
  mappend m Nothing = m
  mappend (Just a) (Just b) = Just (mappend a b)

