module ApplicativeLaws where

import Tip
import qualified Prelude as P

data Maybe a = Just a | Nothing

pure :: a -> Maybe a
pure = Just

fmap :: (a -> b) -> Maybe a -> Maybe b
fmap _ Nothing = Nothing
fmap f (Just x) = Just (f x)

(<*>) :: Maybe (a -> b) -> Maybe a -> Maybe b
Just f <*> m = fmap f m
Nothing <*> m = Nothing

applicativeIdentity :: Maybe a -> Equality (Maybe a)
applicativeIdentity v = pure P.id <*> v === v

applicativeComposition :: (Maybe (b -> a)) -> (Maybe (c -> b)) -> (Maybe c)
                            -> Equality (Maybe a)
applicativeComposition u v w = pure (P..) <*> u <*> v <*> w === u <*> (v <*> w)

applicativeHomomorphism :: (a -> b) -> a -> Equality (Maybe b)
applicativeHomomorphism f x = pure f <*> pure x === pure (f x)

applicativeInterchange :: Maybe (a -> b) -> a -> Equality (Maybe b)
applicativeInterchange u y = u <*> pure y === pure (P.$ y) <*> u
