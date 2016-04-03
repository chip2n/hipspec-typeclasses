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
matrix2Mul (Matrix2 a1 a2 a3 a4) (Matrix2 b1 b2 b3 b4) =
    Matrix2 (add (mul a1 b1) (mul a2 b3))
            (add (mul a1 b2) (mul a2 b4))
            (add (mul a3 b1) (mul a4 b3))
            (add (mul a3 b2) (mul a4 b4))
