module Evaluation.Example.Ring.SemiringMatrix2 where

import Tip
import Evaluation.Matrix2
import Evaluation.Semiring

instance Semiring a => Semiring (Matrix2 a) where
    zero = Matrix2 ((zero, zero)
                   ,(zero, zero))
    one  = Matrix2 ((one, one)
                   ,(one, one))
    add  = matrix2Add
    mul  = matrix2Mul
