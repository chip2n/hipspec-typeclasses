module Evaluation.Example.Group.MonoidNatMul where

import Tip
import Evaluation.Nat
import Evaluation.Semigroup
import Evaluation.Monoid
import Prelude hiding (Monoid(..))

instance Semigroup Nat where
    op = natMul

instance Monoid Nat where
    identity = Succ Zero



--class Semigroup a => Monoid a where
--    mempty  :: a
--    mappend :: a -> a -> a
--    mappend = op
--
--instance Semigroup Nat where
--    op = natMul
--
--instance Monoid Nat where
--    mempty = Succ Zero
--
--lawMonoidLeftId :: Monoid a => a -> Equality a 
--lawMonoidLeftId m = mempty `mappend` m === m
--
--lawMonoidRightId :: Monoid a => a -> Equality a 
--lawMonoidRightId m = m `mappend` mempty === m
--
--lawMonoidAssoc :: Monoid a => a -> a -> a -> Equality a
--lawMonoidAssoc l m r = l `mappend` (m `mappend` r) === (l `mappend` m) `mappend` r
