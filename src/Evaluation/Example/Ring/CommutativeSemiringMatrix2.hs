module Evaluation.Example.Ring.CommutativeSemiringMatrix2 where

import Tip
import Evaluation.Matrix2
import Evaluation.Semiring
import Evaluation.CommutativeSemiring
import Evaluation.Example.Ring.SemiringMatrix2

instance CommutativeSemiring a => CommutativeSemiring (Matrix2 a)
