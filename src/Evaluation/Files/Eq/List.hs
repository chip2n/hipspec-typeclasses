module List where

import Tip

data List a = Empty | Cons a (List a)

instance Eq a => Eq (List a) where
  (==) Empty Empty = True
  (==) (Cons a as) (Cons b bs) = a == b && as == bs
  (==) _ _ = False
