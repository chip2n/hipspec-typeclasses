module GroupNatAdd where

import Tip
import GroupLike
import NatAdd

instance Group Nat

lawSemigroupAssoc :: Group a => a -> a -> a -> Equality a
lawSemigroupAssoc a b c = (a `op` b) `op` c === a `op` (b `op` c)

lawLeftIdentity :: Group a => a -> Equality a 
lawLeftIdentity a = identity `op` a === a

lawRightIdentity :: Group a => a -> Equality a 
lawRightIdentity a = identity `op` a === a
