module Example.Simple3 where

import Tip

data Test = Foo

class Magic z where
  sorcery1 :: z -> z -> Bool
  sorcery2 :: z -> z -> Bool

instance Magic Test where
  sorcery1 Foo Foo = True
  sorcery2 Foo Foo = False

test :: Magic z => z -> Bool
test x = sorcery1 x x

law :: Magic q => q -> Equality Bool
law b = bool (test b)
