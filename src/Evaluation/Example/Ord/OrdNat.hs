module Evaluation.Example.Ord.OrdNat where

import Tip
import Evaluation.Data
import Evaluation.Example.Eq.EqNat

instance Ord Nat where
    Zero     <= _        = True
    (Succ a) <= Zero     = False
    (Succ a) <= (Succ b) = a <= b
