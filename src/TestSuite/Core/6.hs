module Example.MultipleInstances where

import Tip

data Baz a = Foo a | Bar

instance Eq (Baz a) where
  (==) (Foo a) (Foo b) = True
  (==)  Bar     Bar    = True
  (==)  _       _      = False

law :: Eq a => a -> a -> Equality Bool
law a b = bool (True)
