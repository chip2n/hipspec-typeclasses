module Monoid where

import Semigroup

-- TODO: Do we want to redefine Monoid in order to use Semiring?
class Semigroup a => Monoid a where
    mempty  :: a
    mappend :: a -> a -> a
    mappend = op
