module Nat where

import Tip

data Nat = Zero | Succ Nat

instance Eq Nat where
  (Succ a) == (Succ b) = a == b
  Zero     == Zero     = True
  _        == _        = False

instance Ord Nat where
  (Succ a) <= (Succ b) = a <= b
  (Succ a) <= Zero     = False
  _        <= _        = True
