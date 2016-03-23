module Evaluation.Example.Eq.EqTree where

import Evaluation.Data

instance Eq a => Eq (Tree a) where
    Leaf x         == Leaf y         = x == y
    (Branch x1 x2) == (Branch y1 y2) = x1 == y1 && x2 == y2
    _              == _              = False
