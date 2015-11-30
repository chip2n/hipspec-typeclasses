module Example.EqOld where

import HipSpec
import Prelude (Bool(..), (&&))

data Test = Low | Middle | High

{-
instance Eq Test where
    Low    == Low    = True
    Middle == Middle = True
    High   == High   = True
    _      == _      = False
-}

(==) :: Test -> Test -> Bool
Low    == Low    = True
Middle == Middle = True
High   == High   = True
_      == _      = False

reflexivityLaw :: Test -> Prop Bool
reflexivityLaw a = proveBool (a == a)

symmetryLaw :: Test -> Test -> Prop Bool
symmetryLaw a b = proveBool (a == b) ==> proveBool (b == a)

transitivityLaw :: Test -> Test -> Test -> Prop Bool
transitivityLaw a b c = proveBool (a == b && b == c) ==> proveBool (a == c)
