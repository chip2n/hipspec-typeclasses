module NatAdd where

import Tip

data NatAdd = Zero | Succ NatAdd

class Semigroup a where
  op :: a -> a -> a

instance Semigroup NatAdd where
  Zero `op` a = a
  (Succ a) `op` b = Succ (a `op` b)

semigroupAssoc :: Semigroup a => a -> a -> a -> Equality a
semigroupAssoc a b c = (a `op` b) `op` c === a `op` (b `op` c)

