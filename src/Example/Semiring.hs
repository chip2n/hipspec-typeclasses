module Semiring where

import Tip

class Semiring a where
  add :: a -> a -> a
  -- mul :: a -> a -> a

data Nat = Zero | Succ Nat
  deriving Eq
  -- deriving (Eq, Show)

instance Semiring Nat where
  add n Zero = n
  add n (Succ m) = Succ $ add n m
  -- mul n Zero = Zero
  -- mul n (Succ m) = add n $ mul n m

addCommutativity :: Semiring a => a -> a -> Equality a
addCommutativity n m = (add m n) === (add n m)

-- addCommutativityFail :: Semiring a => a -> a -> Equality a
-- addCommutativityFail n m = (add m n) === (add m m)
--
-- addCommutativityFail2 :: Semiring a => a -> a -> Equality a
-- addCommutativityFail2 n m = (add n n) === (add m n)

-- addTransitivity :: Semiring a => a -> a -> a -> Equality a
-- addTransitivity a b c = add (add a b) c === add a (add b c)

-- mulDistributive :: Semiring a => a -> a -> a -> Equality a
-- mulDistributive a b c = mul a (add b c) === add (mul a b) (mul a c)


-- two = Succ $ Succ Zero
-- five = Succ $ Succ $ Succ $ Succ $ Succ Zero
