module Evaluation.Example.Eq.EqList where

import Evaluation.Data

instance Eq a => Eq (List a) where
    Empty       == Empty       = True
    (Cons a as) == (Cons b bs) = a == b && as == bs
    _           == _           = False
