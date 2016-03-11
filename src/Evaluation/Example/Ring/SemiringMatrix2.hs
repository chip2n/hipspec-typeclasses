module Evaluation.Example.Ring.SemiringMatrix2 where

import Tip
import Evaluation.Data
import Evaluation.Semiring

instance Semiring a => Semiring (Matrix2 a) where
    zero = Matrix2 (zero,zero) (zero,zero)
    one  = Matrix2 (one,zero) (zero,one)
    add  = matrix2Add
    mul  = matrix2Mul

-- 2x2 Matrix addition
matrix2Add :: Semiring a => Matrix2 a -> Matrix2 a -> Matrix2 a
matrix2Add (Matrix2 (a1,a2) (a3,a4)) (Matrix2 (b1,b2) (b3,b4)) =
    Matrix2 (add a1 b1, add a2 b2)
            (add a3 b3, add a4 b4)

-- 2x2 Matrix multiplication
--matrix2Mul :: Semiring a => Matrix2 a -> Matrix2 a -> Matrix2 a
--matrix2Mul (Matrix2 a) (Matrix2 b) = Matrix2 (mMul a) (mTransp b)
--      where mTransp ((a1,a2),(b1,b2)) = ((a1,b1),(a2,b2))
--            mMul (a1,a2) (b1,b2) = ((mMulRow a1 b1, mMulRow a1 b2),
--                                   (mMulRow a2 b1, mMulRow a2 b2))
--            mMulRow (x,x') (y,y') = add (mul x y) (mul x' y')

matrix2Mul :: Semiring a => Matrix2 a -> Matrix2 a -> Matrix2 a
matrix2Mul (Matrix2 (a1,a2) (a3,a4)) (Matrix2 (b1,b2) (b3,b4)) =
    Matrix2 (add (mul a1 b1) (mul a2 b3), add (mul a1 b2) (mul a2 b4))
            (add (mul a3 b1) (mul a4 b3), add (mul a3 b2) (mul a4 b4))


--zero = Matrix2 (Zero,Zero) (Zero,Zero)
--one  = Matrix2 (Succ Zero,Zero) (Zero,Succ Zero)
--
---- 2x2 Matrix addition
--matrix2Add :: Matrix2 Nat -> Matrix2 Nat -> Matrix2 Nat
--matrix2Add (Matrix2 (a1,a2) (a3,a4)) (Matrix2 (b1,b2) (b3,b4)) =
--    Matrix2 (natAdd a1 b1, natAdd a2 b2)
--            (natAdd a3 b3, natAdd a4 b4)
--
--matrix2Mul :: Matrix2 Nat -> Matrix2 Nat -> Matrix2 Nat
--matrix2Mul (Matrix2 (a1,a2) (a3,a4)) (Matrix2 (b1,b2) (b3,b4)) =
--    Matrix2 (natAdd (natMul a1 b1) (natMul a2 b3), natAdd (natMul a1 b2) (natMul a2 b4))
--            (natAdd (natMul a3 b1) (natMul a4 b3), natAdd (natMul a3 b2) (natMul a4 b4))
---- Natural numbers addition
--natAdd :: Nat -> Nat -> Nat
--natAdd Zero a     = a
--natAdd (Succ a) b = Succ (natAdd a b)
--
---- Natural numbers multiplication
--natMul :: Nat -> Nat -> Nat
--natMul Zero m     = Zero
--natMul (Succ n) m = natAdd m (natMul n m)

--semiringAddAssoc ::  Matrix2 Nat -> Matrix2 Nat -> Matrix2 Nat -> Equality (Matrix2 Nat)
--semiringAddAssoc a b c = matrix2Add (matrix2Add a b) c === matrix2Add a (matrix2Add b c)
--
--semiringAddComm ::  Matrix2 Nat -> Matrix2 Nat -> Matrix2 Nat -> Equality (Matrix2 Nat)
--semiringAddComm a b c = matrix2Add a b === matrix2Add b a
--
--semiringAddId ::  Matrix2 Nat -> Equality (Matrix2 Nat)
--semiringAddId a = matrix2Add a zero === a
--
--semiringMulAssoc ::  Matrix2 Nat -> Matrix2 Nat -> Matrix2 Nat -> Equality (Matrix2 Nat)
--semiringMulAssoc a b c = matrix2Mul (matrix2Mul a b) c === matrix2Mul a (matrix2Mul b c)
--
--semiringMulId ::  Matrix2 Nat -> Equality (Matrix2 Nat)
--semiringMulId a = matrix2Mul a one === a
--
--semiringMulDistLeft ::  Matrix2 Nat -> Matrix2 Nat -> Matrix2 Nat -> Equality (Matrix2 Nat)
--semiringMulDistLeft a b c = matrix2Mul a (matrix2Add b c) === matrix2Add (matrix2Mul a b) (matrix2Mul a c)
--
--semiringMulDistRight ::  Matrix2 Nat -> Matrix2 Nat -> Matrix2 Nat -> Equality (Matrix2 Nat)
--semiringMulDistRight a b c = matrix2Mul (matrix2Add a b) c === matrix2Add (matrix2Mul a c) (matrix2Mul b c)
--
--semiringMulAnnih ::  Matrix2 Nat -> Equality (Matrix2 Nat)
--semiringMulAnnih a = matrix2Mul a zero === zero
