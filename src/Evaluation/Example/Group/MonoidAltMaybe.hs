module Evaluation.Example.Group.MonoidAltMaybe where

import Evaluation.Data
import Prelude hiding (Maybe(..))

data Maybe a = Just a | Nothing

instance Monoid a => Monoid (Maybe a) where
    mempty = Nothing
    mappend Nothing m = m
    mappend m Nothing = m
    mappend (Just m1) (Just m2) = Just (mappend m1 m2)
