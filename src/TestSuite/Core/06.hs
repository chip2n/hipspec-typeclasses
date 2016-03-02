module Example.MultipleInstances where

import Tip

data Baz a = Foo a | Bar

instance Eq (Baz b) where
  (==) (Foo a) (Foo b) = True
  (==)  Bar     Bar    = True
  (==)  _       _      = False

test :: Eq a => a -> Bool
test a = a == a

law :: Eq a => a -> a -> Equality Bool
law a b = bool (test a)
