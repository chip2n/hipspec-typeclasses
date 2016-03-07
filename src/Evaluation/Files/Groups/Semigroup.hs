module Semigroup where

class Semigroup a where
    op :: a -> a -> a
