module Evaluation.Example.Ring.SemiringBoolAlt where

import Tip
import Evaluation.Semiring

instance Semiring Bool where
    add  = (&&)
    mul  = (||)
    zero = True
    one  = False
