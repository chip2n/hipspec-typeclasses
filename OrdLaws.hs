{-# LANGUAGE TypeOperators #-}

module OrdLaws where

import Tip

-- |Ordering is transitive (if a <= b and b <= c, then a <= c)
transitivityLaw :: Ord a => a -> a -> a -> And Bool Bool :=>: Bool
transitivityLaw a b c = (a <= b .&&. b <= c) ==> a <= c

-- |Ordering is anti-symmetric (if a <= b and b <= a, then a = b)
antiSymmetryLaw :: Ord a => a -> a -> And Bool Bool :=>: Equality a
antiSymmetryLaw a b = (a <= b .&&. b <= a) ==> (a === b)

-- |Ordering is total (either a <= b or b <= a)
totalLaw :: Ord a => a -> a -> Or Bool Bool
totalLaw a b = a <= b .||. b <= a
