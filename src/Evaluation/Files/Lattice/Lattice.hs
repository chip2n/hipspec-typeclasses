module Lattice where

class Lattice a where
  (&.&) :: a -> a -> a
  (|.|) :: a -> a -> a

