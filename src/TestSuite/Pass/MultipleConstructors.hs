module MultipleConstructors where

import Tip

data Type = Const | Ructor

class Class a where
  func :: a -> a -> Bool

instance Class Type where
  func Const  Const  = True
  func Ructor Ructor = True
  func _      _      = False

law :: Class a => a -> a -> Equality Bool
law x y = (func x y) === (func y x)
-- law x = bool (func x x)

