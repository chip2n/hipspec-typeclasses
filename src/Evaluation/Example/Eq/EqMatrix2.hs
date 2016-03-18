module Evaluation.Example.Eq.EqMatrix2 where

import Tip
import Evaluation.Data

instance Eq a => Eq (Matrix2 a) where
    Matrix2 a1 a2 a3 a4 == Matrix2 b1 b2 b3 b4 =
      a1 == b1 && a2 == b2 && a3 == b3 && a4 == b4
