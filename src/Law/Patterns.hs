{-# LANGUAGE TypeOperators #-}

module Law.Patterns where

import Tip

reflexivityLaw :: (a -> a -> Bool) -> a -> Equality Bool 
reflexivityLaw op a = bool (a `op` a)

symmetryLaw :: (a -> a -> Bool) -> a -> a -> Equality Bool :=>: Equality Bool
symmetryLaw op a b = bool (a `op` b) ==> bool (b `op` a)

antiSymmetryLaw :: (a -> a -> Bool) -> a -> a -> Equality Bool :=>: Equality Bool
antiSymmetryLaw op a b = bool (a `op` b && b `op` a) ==> bool (a `op` b)

transitivityLaw :: (a -> a -> Bool) -> a -> a -> a -> Equality Bool :=>: Equality Bool
transitivityLaw op a b c = bool (a `op` b && b `op` c) ==> bool (a `op` c)

totalLaw :: (a -> a -> Bool) -> a -> a -> Equality Bool
totalLaw op a b = bool (a `op` b || b `op` a)
