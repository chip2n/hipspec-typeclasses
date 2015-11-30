module Example.NumOld where

import HipSpec
import Prelude (Bool(..))

data Test = NegativeOne | Zero | One

abs :: Test -> Test
abs NegativeOne = One
abs a           = a

signum :: Test -> Test
signum a           = a

(*) :: Test -> Test -> Test
NegativeOne * NegativeOne = One
NegativeOne * One         = NegativeOne
One         * NegativeOne = NegativeOne
Zero        * _           = Zero
_           * Zero        = Zero

(==) :: Test -> Test -> Bool
NegativeOne == NegativeOne = True
Zero        == Zero        = True
One         == One         = True
_           == _           = False

absSignumLaw :: Test -> Test -> Prop Bool
absSignumLaw x y = proveBool (abs x * signum x == x)
