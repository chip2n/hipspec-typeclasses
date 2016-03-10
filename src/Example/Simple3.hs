{-# LANGUAGE FlexibleInstances #-}

module Example.Simple3 where

import Tip

data Test = Foo
data TestPoly a = Bar a

class Magic z where
  sorcery1 :: z -> z -> Bool
  sorcery2 :: z -> z -> Bool

instance Magic Test where
  sorcery1 Foo Foo = True
  sorcery2 Foo Foo = False

instance Magic (TestPoly Test) where
  sorcery1 (Bar a) (Bar b) = sorcery1 a b
  sorcery2 (Bar a) (Bar b) = sorcery2 a b

--instance Magic z => Magic (TestPoly z) where
--  sorcery1 (Bar a) (Bar b) = sorcery1 a b
--  sorcery2 (Bar a) (Bar b) = sorcery2 a b

--law :: Magic q => q -> Equality Bool
--law b = bool (sorcery1 b b)

yeySorcery1 :: TestPoly Test -> TestPoly Test -> Bool
yeySorcery1 (Bar a) (Bar b) = sorcery1 a b

law :: TestPoly Test -> Equality Bool
law b = bool (yeySorcery1 b b)
