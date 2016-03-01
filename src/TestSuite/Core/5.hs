{-# LANGUAGE MultiParamTypeClasses #-}
module Example.Simple3 where

import Tip

data Test = Foo

class Magic x z where
  sorcery1 :: x -> z -> Bool
  sorcery2 :: x -> z -> Bool

instance Magic Test Test where
  sorcery1 Foo Foo = True
  sorcery2 Foo Foo = False

law :: Magic x z => x -> z -> Equality Bool
law a b = bool (sorcery1 a b)
