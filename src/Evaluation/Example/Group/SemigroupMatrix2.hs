{-# LANGUAGE FlexibleInstances #-}
module Evaluation.Example.Group.SemigroupMatrix2 where

import Tip
import Evaluation.Matrix2
import Evaluation.Nat
import Evaluation.Semigroup
import Evaluation.Example.Ring.SemiringNat

-- TODO: Mention requirement of semiring instance
instance Semigroup (Matrix2 Nat) where
    op = matrix2Mul
