module Example.Functor where

import Tip
import Prelude hiding (Maybe(..))

data Maybe a = Just a | Nothing

instance Functor Maybe where
    fmap _ Nothing  = Nothing
    fmap f (Just x) = Just (f x)
