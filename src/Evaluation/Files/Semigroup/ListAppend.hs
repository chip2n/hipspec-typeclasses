module ListAppend where

import Tip

data List a = Empty | Cons a (List a)

class Semigroup a where
  op :: a -> a -> a

instance Semigroup (List a) where
  op Empty a = a
  op (Cons a as) b = Cons a (op as b)

semigroupAssoc :: Semigroup a => a -> a -> a -> Equality a
semigroupAssoc a b c = (a `op` b) `op` c === a `op` (b `op` c)

