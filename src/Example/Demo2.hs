module Demo2 where

import Tip


data Type = Const

class Class a where
  funcT :: a -> a -> Bool
  funcF :: a -> a -> Bool

instance Class Type where
  funcT Const Const = True
  funcF Const Const = False

law :: Class a => a -> Equality Bool
law x = bool (funcT x x)

law2 :: Class a => a -> Equality Bool
law2 x = (funcF x x) === (funcF x x)
