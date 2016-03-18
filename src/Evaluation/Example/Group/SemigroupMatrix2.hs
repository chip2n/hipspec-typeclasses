{-# LANGUAGE FlexibleInstances #-}
module Evaluation.Example.Group.SemigroupMatrix2 where

import Tip
import Evaluation.Data
import Evaluation.Semigroup
import Evaluation.Semiring
import Evaluation.Example.Ring.SemiringMatrix2

instance Semiring a => Semigroup (Matrix2 a) where
    op = matrix2Mul
