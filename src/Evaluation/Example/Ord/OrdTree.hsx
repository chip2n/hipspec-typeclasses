module Evaluation.Example.Ord.OrdTree where

import Prelude hiding (max)
import Evaluation.Data
import Evaluation.Example.Eq.EqTree
import Evaluation.Example.Ord.OrdNat

instance Eq a => Ord (Tree a) where
    t1 <= t2 = treeHeight t1 <= treeHeight t2

treeHeight :: Tree a -> Nat
treeHeight (Leaf _) = Zero
treeHeight (Branch t1 t2) =
        Succ (max (treeHeight t1) (treeHeight t2))

max :: Nat -> Nat -> Nat
max a Zero = a
max Zero a = a
max (Succ a) (Succ b) = Succ (max a b)
