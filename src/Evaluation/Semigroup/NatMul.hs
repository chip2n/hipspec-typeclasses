module NatMul where

import Tip

data NatPlusMul = One | Succ NatPlusMul
  deriving (Eq, Show)

class Semigroup a where
  func :: a -> a -> a

instance Semigroup NatPlusMul where
  func One a = a
  func (Succ a) b = add b (func a b)
    where add One a = Succ a
          add (Succ a) b = Succ (add a b)

assoc :: Semigroup a => a -> a -> a -> Equality a
assoc a b c = func a (func b c) === func (func a b) c

