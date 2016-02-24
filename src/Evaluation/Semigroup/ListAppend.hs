module ListAppend where

import Tip

data List a = Empty | Cons a (List a)

class Semigroup a where
  func :: a -> a -> a

instance Semigroup (List a) where
  func Empty a = a
  func (Cons a as) b = Cons a (func as b)

assoc :: Semigroup a => a -> a -> a -> Equality a
assoc a b c = func a (func b c) === func (func a b) c
