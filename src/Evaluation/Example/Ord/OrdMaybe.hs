module Evaluation.Example.Ord.OrdMaybe where

import Tip
import Prelude hiding (Maybe(..))
import Evaluation.Example.Eq.EqMaybe

instance Ord a => Ord (Maybe a) where
  Nothing  <= _        = True
  (Just a) <= Nothing  = False
  (Just a) <= (Just b) = a <= b
