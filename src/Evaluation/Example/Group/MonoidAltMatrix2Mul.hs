module Evaluation.Example.Group.MonoidAltMatrix2Mul where

import Evaluation.Data
import Evaluation.Semiring

instance Semiring a => Monoid (Matrix2 a) where
    mempty  = Matrix2 one zero zero one
    mappend = matrix2Mul

-- 2x2 Matrix multiplication
matrix2Mul :: Semiring a => Matrix2 a -> Matrix2 a -> Matrix2 a
matrix2Mul (Matrix2 a11 a12 a21 a22) (Matrix2 b11 b12 b21 b22) =
    Matrix2 (add (mul a11 b11) (mul a12 b21))
            (add (mul a11 b12) (mul a12 b22))
            (add (mul a21 b11) (mul a22 b21))
            (add (mul a21 b12) (mul a22 b22))
