module Nat where

import Tip

data Nat = Zero | Succ Nat

instance Eq Nat where
  (==) Zero Zero = True
  (==) (Succ a) (Succ b) = a == b
  (==) _ _ = False
