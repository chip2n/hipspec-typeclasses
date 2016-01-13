module Demo where

import Tip

data Type = Const

class Class a where
  func :: a -> a -> Bool

instance Class Type where
  func Const Const = True

law :: Class a => a -> Equality Bool
law x = bool (func x x)

