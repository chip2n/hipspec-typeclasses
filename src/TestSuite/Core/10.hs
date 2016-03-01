module Example.Simple3 where

import Tip

data Test = Foo

class Magic z where
  sorcery :: z -> z -> Bool

instance Magic Test where
  sorcery Foo Foo = True

test :: Eq b => b -> Bool
test b = b == b

law :: Magic b => b -> Equality Bool
law b = bool (sorcery b b)
