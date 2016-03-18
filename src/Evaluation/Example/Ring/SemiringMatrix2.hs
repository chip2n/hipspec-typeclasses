module Evaluation.Example.Ring.SemiringMatrix2 where

import Tip
import Evaluation.Data
import Evaluation.Semiring

instance Semiring a => Semiring (Matrix2 a) where
    zero = Matrix2 zero zero zero zero
    one  = Matrix2 one zero zero one
    add  = matrix2Add
    mul  = matrix2Mul

-- 2x2 Matrix addition
matrix2Add :: Semiring a => Matrix2 a -> Matrix2 a -> Matrix2 a
matrix2Add (Matrix2 a1 a2 a3 a4) (Matrix2 b1 b2 b3 b4) =
    Matrix2 (add a1 b1) (add a2 b2) (add a3 b3) (add a4 b4)

matrix2Mul :: Semiring a => Matrix2 a -> Matrix2 a -> Matrix2 a
matrix2Mul (Matrix2 a1 a2 a3 a4) (Matrix2 b1 b2 b3 b4) =
    Matrix2 (add (mul a1 b1) (mul a2 b3)) (add (mul a1 b2) (mul a2 b4))
            (add (mul a3 b1) (mul a4 b3)) (add (mul a3 b2) (mul a4 b4))
