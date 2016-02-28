module NatMul where

import Tip

data NatMul = One | Succ NatMul

class Semigroup a where
  op :: a -> a -> a

instance Semigroup NatMul where
  op One a = a
  op (Succ a) b = add b (op a b)
    where
      add One a = Succ a
      add (Succ a) b = Succ (add a b)

semigroupAssoc :: Semigroup a => a -> a -> a -> Equality a
semigroupAssoc a b c = (a `op` b) `op` c === a `op` (b `op` c)

