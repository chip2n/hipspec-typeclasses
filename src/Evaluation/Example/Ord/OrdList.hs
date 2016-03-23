module Evaluation.Example.Ord.OrdList where

import Evaluation.Data
import Evaluation.Example.Eq.EqList

-- TODO: must create axioms for Eq laws for Ord dummy
-- TODO: correct implementation?
instance Ord a => Ord (List a) where
    Empty       <= _           = True
    (Cons a as) <= Empty       = False
    (Cons a as) <= (Cons b bs)
        | a == b    = as <= bs
        | a < b     = True
        | otherwise = False
