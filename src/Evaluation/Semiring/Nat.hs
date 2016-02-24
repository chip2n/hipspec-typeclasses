module Nat where

import Tip

data Nat = Zero | Succ Nat

class Semiring a where
  add :: a -> a -> a
  mul :: a -> a -> a
  zero :: a
  one  :: a

instance Semiring Nat where
  add Zero a = a
  add (Succ a) b = Succ (add a b)
  mul Zero a = Zero
  mul (Succ a) b = add b (mul a b)
  zero = Zero
  one = Succ Zero

addId :: Semiring a => a -> Equality a
addId a = add a zero === a

mulId :: Semiring a => a -> Equality a
mulId a = mul a one === a

mulAnnih :: Semiring a => a -> Equality a
mulAnnih a = mul a zero === zero

addAssoc :: Semiring a => a -> a -> a -> Equality a
addAssoc a b c = add a (add b c) === add (add a b) c

addComm :: Semiring a => a -> a -> Equality a
addComm a b = add a b === add b a

mulAssoc :: Semiring a => a -> a -> a -> Equality a
mulAssoc a b c = mul a (mul b c) === mul (mul a b) c

mulDistLeft :: Semiring a => a -> a -> a -> Equality a
mulDistLeft a b c = mul a (add b c) === add (mul a b) (mul a c)

mulDistRight :: Semiring a => a -> a -> a -> Equality a
mulDistRight a b c = mul (add a b) c === add (mul a c) (mul b c)
