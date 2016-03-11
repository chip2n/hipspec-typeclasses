{-# LANGUAGE FlexibleInstances #-}
module Evaluation.Example.Group.SemigroupMatrix2 where

import Tip
import Evaluation.Data
import Evaluation.Semigroup
import Evaluation.Example.Ring.SemiringMatrix2

instance Semigroup (Matrix2 a) where
    op = matrix2Mul
