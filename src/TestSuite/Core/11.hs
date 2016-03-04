{-# LANGUAGE ScopedTypeVariables #-}

module Test where

import Tip

-- This caused list data type to not be constructed

data Meh = Yo | Lo
data Test a = Foo a | Bar

class Derp a where
    lol :: [a] -> Bool

instance Derp Meh where
    lol [] = True
    lol _ = False

instance Derp a => Derp (Test a) where
    lol [Foo a] = True
    lol _ = False

flerp :: Derp a => a -> a -> Equality Bool
flerp a b = bool True
