module Evaluation.Matrix2 where

import Evaluation.Semiring

data Matrix2 a = Matrix2 (
    (a, a)
  , (a, a))

-- 2x2 Matrix addition
matrix2Add :: Semiring a => Matrix2 a -> Matrix2 a -> Matrix2 a
matrix2Add (Matrix2 (a,a')) (Matrix2 (b,b')) =
    Matrix2 (add2 a b, add2 a' b')
  where add2 (x,x') (y,y') = (add x y, add x' y')

-- 2x2 Matrix multiplication
matrix2Mul :: Semiring a => Matrix2 a -> Matrix2 a -> Matrix2 a
matrix2Mul (Matrix2 a) (Matrix2 b) = Matrix2 $ mMul a $ mTransp b
  where mTransp ((a1,a2),(b1,b2)) = ((a1,b1),(a2,b2))
        mMul (a1,a2) (b1,b2) = ((mMulRow a1 b1, mMulRow a1 b2),
                                (mMulRow a2 b1, mMulRow a2 b2))
        mMulRow (x,x') (y,y') = add (mul x y) (mul x' y')
