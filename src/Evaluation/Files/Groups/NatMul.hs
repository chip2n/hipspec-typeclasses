module NatMul where

import GroupLike

data Nat = One | Succ Nat

instance GroupLike Nat where
    One      `op` a = a
    (Succ a) `op` b = add b (a `op` b)
      where add One a      = Succ a
            add (Succ a) b = Succ (add a b)

instance GroupLikeWithIdentity Nat where
    identity = One
