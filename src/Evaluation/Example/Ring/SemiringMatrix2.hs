module Evaluation.Example.Ring.SemiringMatrix2 where

import Tip
import Evaluation.Data
import Evaluation.Semiring

-- TODO: inlined methods allows identity for multiplication to be proven. Why?
instance Semiring a => Semiring (Matrix2 a) where
    zero = Matrix2 zero zero zero zero
    one  = Matrix2 one zero zero one
    add (Matrix2 a11 a12 a21 a22) (Matrix2 b11 b12 b21 b22) =
        Matrix2 (add a11 b11) (add a12 b12)
                (add a21 b21) (add a22 b22)
    mul (Matrix2 a11 a12 a21 a22) (Matrix2 b11 b12 b21 b22) =
        Matrix2 (add (mul a11 b11) (mul a12 b21))
                (add (mul a11 b12) (mul a12 b22))
                (add (mul a21 b11) (mul a22 b21))
                (add (mul a21 b12) (mul a22 b22))
