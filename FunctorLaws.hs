module Maybe where

import Tip
import qualified Prelude

data Maybe a = Just a | Nothing

fmap :: (a -> b) -> Maybe a -> Maybe b
fmap _ Nothing = Nothing
fmap f (Just x) = Just (f x)

id :: a -> a
id a = a

func a b = fmap id === id
