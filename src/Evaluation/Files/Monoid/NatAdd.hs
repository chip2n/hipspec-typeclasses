module NatAdd where

import Tip

data NatAdd = Zero | Succ NatAdd

instance Monoid NatAdd where
  mempty = Zero
  Zero `mappend` a = a
  (Succ a) `mappend` b = Succ (a `mappend` b)

