module Evaluation.Example.Ord.OrdTree where

import Evaluation.Data
import Evaluation.Example.Eq.EqTree

instance Ord a => Ord (Tree a) where
--    Leaf _         <= Leaf _         = True
--    (Branch x1 x2) <= (Branch y1 y2) = max (
--    _ <= _ = False
    t1 <= t2 = treeHeight t1 <= treeHeight t2

treeHeight :: Tree a -> Int
treeHeight (Leaf _) = 0
treeHeight (Branch t1 t2) = max (treeHeight t1) (treeHeight t2) + 1
