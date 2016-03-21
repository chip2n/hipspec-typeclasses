module Flerp where

import Prelude hiding (succ)
import Tip

data Nat = Zero | Succ Nat
  deriving Show
data Nat2 = Zero2 | Succ2 Nat2
  deriving Show

class Nattish a where
  zero :: a
  succ :: a -> a
  isZero :: a -> Bool
  getPred :: a -> a

instance Nattish Nat where
  zero = Zero
  isZero Zero = True
  isZero _ = False
  succ a = Succ a
  getPred (Succ a) = a

instance Nattish Nat2 where
  zero = Zero2
  isZero Zero2 = True
  isZero _ = False
  succ a = Succ2 a
  getPred (Succ2 a) = a

-- Natural numbers multiplication
natMul :: Nattish a => a -> a -> a
natMul n m | isZero n = n
natMul n m = natAdd m (natMul (getPred n) m)
  where natAdd a b | isZero a = b
        natAdd a b = succ (natAdd (getPred a) b)

property :: Nat -> Nat -> Equality Nat
property a b = natMul a b === natMul b a

two = Succ $ Succ Zero
three = Succ $ Succ $ Succ Zero
