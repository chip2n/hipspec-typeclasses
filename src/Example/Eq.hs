{-# LANGUAGE TypeOperators #-}

module Example.Eq where

import Tip

data Test = Low | Middle | High

instance Eq Test where
    Low    == Low    = True
    Middle == Middle = True
    High   == High   = True
    _      == _      = False

--reflexivityLaw :: Eq a => a -> Equality Bool
--reflexivityLaw a = bool (a == a)
--
--symmetryLaw :: Eq a => a -> a -> Equality Bool :=>: Equality Bool
--symmetryLaw a b = bool (a == b) ==> bool (b == a)
--
--transitivityLaw :: Eq a => a -> a -> a -> Equality Bool :=>: Equality Bool
--transitivityLaw a b c = bool (a == b && b == c) ==> bool (a == c)
