module ListAppend where

import Tip

data List a = Empty | Cons a (List a)

instance Monoid (List a) where
  mempty = Empty
  mappend Empty a = a
  mappend (Cons a as) b = Cons a (mappend as b)
