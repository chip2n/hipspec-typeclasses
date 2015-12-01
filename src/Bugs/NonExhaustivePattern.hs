{-# LANGUAGE TypeOperators #-}

module Example.Eq where

import Tip
import Prelude (Bool(..))

data Test = A | B | C

func :: Test -> Bool
func A = True

-- emna: theorySignature
prop :: Test -> Equality Bool
prop a = bool (func a)
