module Evaluation.Example.Ord.OrdTree where

import Prelude hiding (max)
import Evaluation.Data
import Evaluation.Example.Eq.EqTree
import Evaluation.Example.Ord.OrdNat

instance Ord a => Ord (Tree a) where
    (Leaf _) <= (Branch _ _) = True
    (Leaf x) <= (Leaf y) = x <= y
    (Branch _ _) <= (Leaf _) = False
    (Branch l r) <= (Branch l' r') = l == l' && r <= r' || l <= l'
