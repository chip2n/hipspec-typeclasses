{-# LANGUAGE TypeOperators #-}

module Example.Eq where

import Tip
import Prelude (Bool(..), (&&), (.))

data Maybe a = Just a | Nothing

fmap :: (a -> b) -> Maybe a -> Maybe b
fmap _ Nothing  = Nothing
fmap f (Just x) = Just (f x)

id :: a -> a
id a = a

functorLaw1 :: (Maybe a) -> Equality (Maybe a)
functorLaw1 a = fmap id a === id a

functorLaw2 :: (Maybe a) -> (b -> c) -> (a -> b) -> Equality (Maybe c)
functorLaw2 a f g = (fmap f . fmap g) a === fmap (f . g) a
