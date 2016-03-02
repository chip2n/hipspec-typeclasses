module Example.Simple where

import Tip

data Test = Foo

class Magic z where
  sorcery :: z -> z -> Bool

instance Magic Test where
  sorcery Foo Foo = True

law :: Magic q => q -> Equality Bool
law b = bool (sorcery b b)
