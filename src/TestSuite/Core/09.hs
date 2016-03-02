module Example.Simple3 where

import Tip

data Test = Foo

class Magic z where
  sorcery1 :: a -> z -> Bool

instance Magic Test where
  sorcery1 a Foo = True

law :: Magic b => a -> b -> Equality Bool
law a b = bool (sorcery1 a b)
