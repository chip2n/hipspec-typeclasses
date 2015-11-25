{-# LANGUAGE TypeOperators #-}

module IxLaws where

import Tip
import Data.Ix

law1 :: (Ix a) => a -> a -> a -> Equality Bool
law1 l u i = inRange (l,u) i === i `elem` (range (l,u))

law2 :: (Ix a) => a -> a -> a -> Bool :=>: Equality a
law2 l u i = inRange (l,u) i ==> (range (l,u) !! index (l,u) i === i)

law3 :: (Ix a) => a -> a -> Equality [Int]
law3 l u = map (index (l,u)) (range (l,u)) === [0..rangeSize (l,u)-1]

law4 :: (Ix a) => a -> a -> Equality Int
law4 l u = rangeSize (l,u) === length (range (l,u))
