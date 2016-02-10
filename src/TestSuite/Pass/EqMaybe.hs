module TestSuite.EqMaybe where

import Tip
import Prelude hiding (Maybe(..))

data Maybe a = Just a | Nothing

instance Eq a => Eq (Maybe a) where
  (==) (Just a) (Just b) = a == b
  (==)  Nothing Nothing  = True
  (==)  _       _        = False

law :: Eq a => a -> a -> Equality Bool
law a b = bool (a == b)
