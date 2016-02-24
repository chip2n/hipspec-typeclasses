module NatAdd where

import Tip

data NatPlusAdd = One | Succ NatPlusAdd

class Semigroup a where
  func :: a -> a -> a

instance Semigroup NatPlusAdd where
  func One a = Succ a
  func (Succ a) b = Succ (func a b)

assoc :: Semigroup a => a -> a -> a -> Equality a
assoc a b c = func a (func b c) === func (func a b) c
