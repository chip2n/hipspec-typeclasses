module Evaluation.Example.Group.MonoidMatrix2Mul where

import Evaluation.Data
import Evaluation.Monoid
import Evaluation.Semiring
import Evaluation.Example.Group.SemigroupMatrix2
import Prelude hiding (Monoid(..))

instance Semiring a => Monoid (Matrix2 a) where
    identity = Matrix2 one zero one zero
