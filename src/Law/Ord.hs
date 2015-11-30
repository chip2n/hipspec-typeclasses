{-# LANGUAGE TypeOperators #-}

module Law.Ord where

import Tip

-- |Ordering is transitive (if a <= b and b <= c, then a <= c)
transitivityLaw :: Ord a => a -> a -> a -> Equality Bool :=>: Equality Bool
transitivityLaw a b c = bool (a <= b && b <= c) ==> bool (a <= c)

-- |Ordering is anti-symmetric (if a <= b and b <= a, then a = b)
antiSymmetryLaw :: Ord a => a -> a -> Equality Bool :=>: Equality Bool
antiSymmetryLaw a b = bool (a <= b && b <= a) ==> bool (a == b)

-- |Ordering is total (either a <= b or b <= a)
totalLaw :: Ord a => a -> a -> Equality Bool
totalLaw a b = bool (a <= b || b <= a)
