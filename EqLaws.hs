{-# LANGUAGE TypeOperators #-}

module EqLaws where

import Tip

-- |Equality is reflexive (x == x should always be True)
-- TODO: Reflexivity does not hold for Float/Double (NaN == NaN returns False)
reflexivityLaw :: Eq a => a -> Equality Bool 
reflexivityLaw a = bool (a == a)

-- |Equality is symmetric (a == b iff b == a)
symmetryLaw :: Eq a => a -> a -> And (Bool :=>: Bool) (Bool :=>: Bool)
symmetryLaw a b = ((a == b) ==> (b == a)) .&&. ((b == a) ==> (a == b))

-- |Equality is transitive (if a <= b and b <= c, then a <= c)
transitivityLaw :: Eq a => a -> a -> a -> And Bool Bool :=>: Bool
transitivityLaw a b c = (a == b .&&. b == c) ==> a == c

-- NOTE: If instance of Eq is structural, substitution law holds
-- (if a == b then f a == f b for all f)
