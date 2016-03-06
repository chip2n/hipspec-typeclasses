module MonoidNatAdd where

import Tip
import GroupLike
import NatAdd

-- TODO: The op method is renamed in an ugly way...

instance Monoid Nat where
  mempty = identity
  mappend = op
