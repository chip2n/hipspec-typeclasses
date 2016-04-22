module Evaluation.Example.Ord.OrdList where

import Evaluation.Data
import Evaluation.Example.Eq.EqList

instance Ord a => Ord (List a) where
    Empty       <= _           = True
    (Cons a as) <= Empty       = False
    (Cons a as) <= (Cons b bs)
        | a == b    = as <= bs
        | otherwise = a < b
