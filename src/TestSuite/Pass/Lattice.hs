module Nat where

import Tip

--If importing it works---
-- import Tip.Prelude as P
-- instance Lattice Nat where
--   (&.&) = P.min
--   (|.|) = P.max
--------------------------

--------------------------
class Lattice a where
  (&.&) :: a -> a -> a
  (|.|) :: a -> a -> a

data Nat = Zero | Succ Nat

instance Lattice Nat where
  (&.&) = natMin
  (|.|) = natMax

natMin :: Nat -> Nat -> Nat
natMin Zero _ = Zero
natMin _ Zero = Zero
natMin (Succ a) (Succ b) = Succ (natMin a b)

natMax :: Nat -> Nat -> Nat
natMax Zero b = b
natMax a Zero = a
natMax (Succ a) (Succ b) = Succ (natMax a b)
--------------------------

latticeCommAnd :: Lattice a => a -> a -> Equality a
latticeCommAnd a b = a &.& b === b &.& a
