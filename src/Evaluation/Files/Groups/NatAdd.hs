module NatAdd where

import GroupLike

data Nat = Zero | Succ Nat

instance GroupLike Nat where
    Zero     `op` a = a
    (Succ a) `op` b = Succ (a `op` b)

instance GroupLikeWithIdentity Nat where
    identity = Zero
