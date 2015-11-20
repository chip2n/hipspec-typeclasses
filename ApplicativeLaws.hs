module ApplicativeLaws where

import Tip
import qualified Prelude as P

data Maybe a = Just a | Nothing

pure :: a -> Maybe a
pure = Just

(<*>) :: (a -> Maybe b) -> Maybe a -> Maybe b
Just f <*> m = fmap f m
Nothing <*> m = Nothing

applicative_identity v = pure P.id <*> v === v
applicative_composition u v w = pure (P..) <*> u <*> v <*> w === u <*> (v <*> w)
applicative_homomorphism f x = pure f <*> x === pure (f x)
applicative_interchange u y = u <*> pure y === (P.$ y) <*> u
