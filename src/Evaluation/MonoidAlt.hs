module Evaluation.MonoidAlt where

import Tip
import Prelude hiding (Monoid(..))

class Monoid a where
    mempty  :: a
    mappend :: a -> a -> a
    mconcat :: [a] -> a
    mconcat = foldr mappend mempty

lawMonoidAssoc :: Monoid a => a -> a -> a -> Equality a
lawMonoidAssoc a b c =
    (a `mappend` b) `mappend` c === a `mappend` (b `mappend` c)

lawMonoidLeftId :: Monoid a => a -> Equality a 
lawMonoidLeftId m = mempty `mappend` m === m

lawMonoidRightId :: Monoid a => a -> Equality a 
lawMonoidRightId m = m `mappend` mempty === m
