module Evaluation.Monoid where

import Tip
import Evaluation.Semigroup
import Prelude hiding (Monoid(..))

class Semigroup a => Monoid a where
    identity  :: a

lawMonoidLeftId :: Monoid a => a -> Equality a 
lawMonoidLeftId m = identity `op` m === m

lawMonoidRightId :: Monoid a => a -> Equality a 
lawMonoidRightId m = m `op` identity === m
