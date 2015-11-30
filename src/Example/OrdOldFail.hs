module Example.OrdOldFail where

import HipSpec
import Prelude (Bool(..), Ord, Eq, (||), (&&))

data Test = Low | Middle | High
    deriving (Eq, Ord)

(==) :: Test -> Test -> Bool
Low    == Low    = True
Middle == Middle = True
High   == High   = True
_      == _      = False

(<=) :: Test -> Test -> Bool
Low    <= Middle = False
Middle <= Low    = False
Middle <= High   = True
High   <= Middle = True
_      <= _      = False

transitivityLaw :: Test -> Test -> Test -> Prop Bool
transitivityLaw a b c = proveBool ((a <= b) && (b <= c)) ==> proveBool (a <= c)

antiSymmetryLaw :: Test -> Test -> Prop Bool
antiSymmetryLaw a b = proveBool ((a <= b) && (b <= a)) ==> proveBool (a == b)

totalLaw :: Test -> Test -> Prop Bool
totalLaw a b = proveBool (a <= b || b <= a)
