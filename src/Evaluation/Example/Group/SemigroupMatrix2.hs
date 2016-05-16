{-# LANGUAGE FlexibleInstances #-}
module Evaluation.Example.Group.SemigroupMatrix2 where

import Tip
import Evaluation.Data
import Evaluation.Semigroup
import Evaluation.Semiring

instance Semiring a => Semigroup (Matrix2 a) where
    op = matrix2Mul

-- 2x2 Matrix multiplication
matrix2Mul :: Semiring a => Matrix2 a -> Matrix2 a -> Matrix2 a
matrix2Mul (Matrix2 a11 a12 a21 a22) (Matrix2 b11 b12 b21 b22) =
    Matrix2 (add (mul a11 b11) (mul a12 b21))
            (add (mul a11 b12) (mul a12 b22))
            (add (mul a21 b11) (mul a22 b21))
            (add (mul a21 b12) (mul a22 b22))
