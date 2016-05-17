module Evaluation.Example.Group.SemigroupMaybe where

import Evaluation.Data
import Evaluation.Semigroup

instance Semigroup a => Semigroup (Maybe a) where
    Nothing  `op` m        = m
    m        `op` Nothing  = m
    (Just a) `op` (Just b) = Just (a `op` b)
