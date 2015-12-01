{-# LANGUAGE TypeOperators #-}

module Example.Ord where

import Tip
import Prelude (Bool(..), Ord, Eq, (&&), (||))

data Test = Low | Middle | High

-- Equality definition without wildcards
(==) :: Test -> Test -> Bool
Low    == Low    = True
Low    == Middle = False
Low    == High   = False
Middle == Low    = False
Middle == Middle = True
Middle == High   = False
High   == Low    = False
High   == Middle = False
High   == High   = True

-- Ord definition without wildcards
(<=) :: Test -> Test -> Bool
Low    <= Low    = True
Low    <= Middle = True
Low    <= High   = True
Middle <= Low    = False
Middle <= Middle = True
Middle <= High   = True
High   <= Low    = False
High   <= Middle = False
High   <= High   = True

{-
(<=) :: Test -> Test -> Bool
_      <= High   = True
Low    <= Middle = True
Middle <= Middle = True
Low    <= Low    = True
_      <= _      = False
-}

transitivityLaw :: Test -> Test -> Test -> Equality Bool :=>: Equality Bool
transitivityLaw a b c = bool (a <= b && b <= c) ==> bool (a <= c)

antiSymmetryLaw :: Test -> Test -> Equality Bool :=>: Equality Bool
antiSymmetryLaw a b = bool (a <= b && b <= a) ==> bool (a == b)

totalLaw :: Test -> Test -> Equality Bool
totalLaw a b = bool (a <= b || b <= a)
