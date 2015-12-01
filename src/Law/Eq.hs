{-# LANGUAGE TypeOperators #-}

module Law.Eq where

import Tip

-- |Equality is reflexive (x == x should always be True)
-- TODO: Reflexivity does not hold for Float/Double (NaN == NaN returns False)
reflexivityLaw :: Eq a => a -> Equality Bool 
reflexivityLaw a = bool (a == a)

-- |Equality is symmetric (a == b if b == a)
symmetryLaw :: Eq a => a -> a -> Equality Bool :=>: Equality Bool
symmetryLaw a b = bool (a == b) ==> bool (b == a)

-- |Equality is transitive (if a <= b and b <= c, then a <= c)
transitivityLaw :: Eq a => a -> a -> a -> Equality Bool :=>: Equality Bool
transitivityLaw a b c = bool (a == b && b == c) ==> bool (a == c)

-- NOTE: If instance of Eq is structural, substitution law holds
-- (if a == b then f a == f b for all f)
