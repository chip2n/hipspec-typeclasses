module Example.MultipleInstances where

import Tip

data Test = Foo
data Test2 = Foo2

class Magic z where
  sorcery :: z -> z -> Bool

instance Magic Test where
  sorcery Foo Foo = True

instance Magic Test2 where
  sorcery Foo2 Foo2 = True

law :: Magic q => q -> Equality Bool
law b = bool (sorcery b b)
