module Evaluation.Example.Eq.EqMaybe where

import Evaluation.Data
import Prelude hiding (Maybe(..))

data Maybe a = Just a | Nothing

instance Eq a => Eq (Maybe a) where
    Nothing  == Nothing  = True
    (Just a) == (Just b) = a == b
    _        == _        = False
