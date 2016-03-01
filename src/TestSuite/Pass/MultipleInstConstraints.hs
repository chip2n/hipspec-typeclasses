module TestSuite.EqMaybe where

import Tip
import Prelude hiding (Maybe(..))

data Maybe a = Just a | Nothing

instance Monoid a => Monoid (Maybe a) where
  mempty = Nothing
  Nothing `mappend` m = m
  m `mappend` Nothing = m
  Just m1 `mappend` Just m2 = Just (m1 `mappend` m2)

instance (Eq b, Monoid b) => Eq (Maybe b) where
  Just x  == Just y  = mappend mempty x == y
  Nothing == Nothing = True
  _       == _       = False
