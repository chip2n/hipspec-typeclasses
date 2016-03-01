module Matrix where

import Tip

data Matrix2 = Matrix2 ((Nat, Nat)
                       ,(Nat, Nat)
                       )

data Matrix3 = Matrix3 ((Nat, Nat, Nat)
                       ,(Nat, Nat, Nat)
                       ,(Nat, Nat, Nat)
                       )

data Matrix4 = Matrix4 ((Nat, Nat, Nat, Nat)
                       ,(Nat, Nat, Nat, Nat)
                       ,(Nat, Nat, Nat, Nat)
                       ,(Nat, Nat, Nat, Nat)
                       )

data Nat = Zero | Succ Nat

class Semiring a where
  add  :: a -> a -> a
  mul  :: a -> a -> a
  zero :: a
  one  :: a

instance Semiring Nat where
  zero = Zero
  one  = Succ Zero
  add Zero a = a
  add (Succ a) b = Succ (add a b)
  mul Zero a = Zero
  mul (Succ a) b = add b (mul a b)

instance Semiring Matrix2 where
  zero = Matrix2 ((Zero, Zero) ,(Zero, Zero))
  one  = Matrix2 ((Succ Zero, Succ Zero) ,(Succ Zero, Succ Zero))
  add a b = matrixAdd2 a b
  mul a b = matrixMul2 a b

natAdd :: Nat -> Nat -> Nat
natAdd Zero a = a
natAdd (Succ a) b = Succ (natAdd a b)

natMul :: Nat -> Nat -> Nat
natMul Zero a = Zero
natMul (Succ a) b = natAdd b (natMul a b)

matrixAdd2 :: Matrix2 -> Matrix2 -> Matrix2
matrixAdd2 (Matrix2 (a,a')) (Matrix2 (b,b')) = Matrix2 (add2 a b, add2 a' b')
  where add2 (x,x') (y,y') = (add x y, add x' y')

matrixMul2 :: Matrix2 -> Matrix2 -> Matrix2
matrixMul2 (Matrix2 a) (Matrix2 b) = Matrix2 $ mMul a $ mTransp b
  where mTransp ((a1,a2),(b1,b2)) = ((a1,b1),(a2,b2))
        mMul (a1,a2) (b1,b2) = ((mMulRow a1 b1, mMulRow a1 b2),
                                (mMulRow a2 b1, mMulRow a2 b2))
        mMulRow (x,x') (y,y') = add (mul x y) (mul x' y')

semiringAddAssoc :: Semiring a => a -> a -> a -> Equality a
semiringAddAssoc a b c = add (add a b) c === add a (add b c)

semiringAddComm :: Semiring a => a -> a -> a -> Equality a
semiringAddComm a b c = add a b === add b a

semiringAddId :: Semiring a => a -> Equality a
semiringAddId a = add a zero === a

semiringMulAssoc :: Semiring a => a -> a -> a -> Equality a
semiringMulAssoc a b c = mul (mul a b) c === mul a (mul b c)

semiringMulId :: Semiring a => a -> Equality a
semiringMulId a = mul a one === a

semiringMulDistLeft :: Semiring a => a -> a -> a -> Equality a
semiringMulDistLeft a b c = mul a (add b c) === add (mul a b) (mul a c)

semiringMulDistRight :: Semiring a => a -> a -> a -> Equality a
semiringMulDistRight a b c = mul (add a b) c === add (mul a c) (mul b c)

semiringMulAnnih :: Semiring a => a -> Equality a
semiringMulAnnih a = mul a zero === zero

