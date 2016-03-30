module Evaluation.Example.Ring.SemiringBool where

import Tip
import Evaluation.Semiring

instance Semiring Bool where
    add  = (&&)
    mul  = (||)
    zero = True
    one  = False
