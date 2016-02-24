module NatAdd where

import Prelude hiding (id)
import Tip

data Nat = Zero | Succ Nat

class Group a where
  id :: a
  append :: a -> a -> a

instance Group Nat where
  id = Zero
  append Zero     a = a
  append (Succ a) b = Succ (a `append` b)

assoc :: Group a => a -> a -> a -> Equality a
assoc a b c = a `append` (b `append` c) === (a `append` b) `append` c

existsId :: Group a => a -> Equality a
existsId a = a `append` id === a

inverse :: Group a => a -> Forall a (Exists a (Equality a))
inverse m = forAll (\m -> exists (\n -> m `append` n === id))

