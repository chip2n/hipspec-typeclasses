module NatAdd where

import Tip

data NatAdd = Zero | Succ Nat

class Group a where
  op :: a -> a -> a

instance Group NatAdd where
  Zero `op` a = a
  (Succ a) `op` b = Succ (a `op` b)

groupAssoc :: Group a => a -> a -> a -> Equality a
groupAssoc a b c = (a `op` b) `op` c === a `op` (b `op` c)
