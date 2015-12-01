module Law.Functor where

import Tip
import qualified Prelude as P

data Maybe a = Just a | Nothing

fmap :: (a -> b) -> Maybe a -> Maybe b
fmap _ Nothing  = Nothing
fmap f (Just x) = Just (f x)

id :: a -> a
id a = a

functorLaw1 :: (Maybe a) -> Equality (Maybe a)
functorLaw1 a = fmap P.id a === P.id a

functorLaw2 :: (Maybe a) -> (b -> c) -> (a -> b) -> Equality (Maybe c)
functorLaw2 a f g = (fmap f P.. fmap g) a === fmap (f P.. g) a
