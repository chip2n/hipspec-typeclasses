module Example.Simple2 where

import Tip

data Test = Foo

class Magic z where
  sorcery1 :: z -> z -> Bool
  sorcery2 :: z -> z -> Bool

instance Magic Test where
  sorcery1 Foo Foo = True
  sorcery2 Foo Foo = False

law :: Magic q => q -> Equality Bool
law b = bool (sorcery1 b b)
