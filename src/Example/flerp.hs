module Flerp where

import Tip

data Nat = Zero | Succ Nat

-- Natural numbers multiplication
natMul :: Nat -> Nat -> Nat
natMul Zero m = Zero
natMul (Succ n) m = natAdd m (natMul n m)
  where natAdd Zero a     = a
        natAdd (Succ a) b = Succ (natAdd a b)

property :: Nat -> Nat -> Equality Nat
property a b = natMul a b === natMul b a
