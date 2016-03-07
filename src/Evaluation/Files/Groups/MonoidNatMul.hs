module MonoidNatMul where

import Tip
import Nat
import Semigroup
import Prelude hiding (Monoid(..))

-- TODO: Do we want to redefine Monoid in order to use Semiring?
-- TODO: Move into separate file
-- TODO: Mention the lack of mappend in thesis
class Semigroup a => Monoid a where
    identity  :: a

instance Semigroup Nat where
    op = natMul

instance Monoid Nat where
    identity = Succ Zero

lawSemigroupAssoc :: Semigroup a => a -> a -> a -> Equality a
lawSemigroupAssoc a b c = (a `op` b) `op` c === a `op` (b `op` c)

lawMonoidLeftId :: Monoid a => a -> Equality a 
lawMonoidLeftId m = identity `op` m === m

lawMonoidRightId :: Monoid a => a -> Equality a 
lawMonoidRightId m = m `op` identity === m



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
