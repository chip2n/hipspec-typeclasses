module LatticeNat where

import Tip
import Nat
import Lattice

instance Lattice Nat where
  (&.&) Zero _ = Zero
  (&.&) _ Zero = Zero
  (&.&) (Succ a) (Succ b) = Succ $ a &.& b
  (|.|) Zero a = a
  (|.|) a Zero = a
  (|.|) (Succ a) (Succ b) = Succ $ a |.| b

