module Evaluation.Example.Eq.EqNat where

import Tip
import Evaluation.Data

instance Eq Nat where
    Zero     == Zero     = True
    (Succ a) == (Succ b) = a == b
    _        == _        = False
