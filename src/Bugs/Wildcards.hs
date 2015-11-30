module Bugs.Wildcards where

import Tip
import Prelude (Bool(..))

data Test = A | B

func :: Test -> Test -> Bool
func A A = True
func _ _ = False

-- emna: Lint failed after UncurryTheory:
-- Type constructor Void# not in scope
prop :: Test -> Equality Bool
prop a = bool (func a a)
