module Evaluation.Example.Eq.EqMatrix2 where

import Tip
import Evaluation.Data

instance Eq a => Eq (Matrix2 a) where
    Matrix2 a11 a12 a21 a22 == Matrix2 b11 b12 b21 b22 =
      a11 == b11 && a12 == b12 && a21 == b21 && a22 == b22
