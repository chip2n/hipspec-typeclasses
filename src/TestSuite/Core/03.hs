module Example.Simple3 where

import Tip

data Test = Foo
data TestPoly a = Bar a | Baz

class Magic z where
  sorcery1 :: z -> z -> Bool
  sorcery2 :: z -> z -> Bool

instance Magic Test where
  sorcery1 Foo Foo = True
  sorcery2 Foo Foo = False

instance Magic z => Magic (TestPoly z) where
  sorcery1 (Bar a) (Bar b) = sorcery1 a b
  sorcery1 Baz     Baz     = True
  sorcery1 _       _       = False
  sorcery2 (Bar a) (Bar b) = sorcery2 a b
  sorcery2 Baz     Baz     = True
  sorcery2 _       _       = False

law :: Magic q => q -> Equality Bool
law b = bool (sorcery1 b b)
