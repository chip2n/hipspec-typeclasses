module Nat where

import Tip

data Nat = Zero | Succ Nat

instance Eq Nat where
  (==) Zero     Zero     = True
  (==) Zero     (Succ _) = False
  (==) (Succ _) Zero     = False
  (==) (Succ a) (Succ b) = a == b

