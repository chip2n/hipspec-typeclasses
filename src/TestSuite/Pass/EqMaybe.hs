module TestSuite.EqMaybe where

import Tip
import Prelude hiding (Maybe(..))

data Maybe a = Just a | Nothing

instance Eq b => Eq (Maybe b) where
  Just x  == Just y  = x == y
  Nothing == Nothing = True
  _       == _       = False
