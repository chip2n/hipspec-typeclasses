module Example.SimpleEq2 where

import Tip

data Test = Foo
data Test2 = Foo2

class Magic z where
  sorcery1 :: z -> z -> Bool
  sorcery2 :: z -> z -> Bool

instance Magic Test where
  sorcery1 Foo Foo = True
  sorcery2 Foo Foo = False

instance Magic Test2 where
  sorcery1 Foo2 Foo2 = True
  sorcery2 Foo2 Foo2 = False

law :: Magic q => q -> Equality Bool
law b = bool (sorcery1 b b)
