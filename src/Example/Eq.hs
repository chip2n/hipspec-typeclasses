{-# LANGUAGE TypeOperators #-}

module Example.Eq where

import Tip
--import Prelude (Bool(..), (&&))

data Test = Low | Middle | High

instance Eq Test where
    Low    == Low    = True
    Middle == Middle = True
    High   == High   = True
    _      == _      = False

-- Equality definition without wildcards
{-
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
-}

{-
(==) :: Test -> Test -> Bool
Low    == Low    = True
Middle == Middle = True
High   == High   = True
_      == _      = False
-}

reflexivityLaw :: Test -> Equality Bool
reflexivityLaw a = bool (a == a)

symmetryLaw :: Test -> Test -> Equality Bool :=>: Equality Bool
symmetryLaw a b = bool (a == b) ==> bool (b == a)

transitivityLaw :: Test -> Test -> Test -> Equality Bool :=>: Equality Bool
transitivityLaw a b c = bool (a == b && b == c) ==> bool (a == c)
