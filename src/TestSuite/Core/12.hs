{-# LANGUAGE ScopedTypeVariables #-}

module Test where

import Tip

-- This caused an error function to not be constructed (since missing pattern matcing cases)

data Meh = Yo | Lo
data Test a = Foo a | Bar

class Derp a where
    lol :: [a] -> Bool

instance Derp Meh where
    lol [] = True

instance Derp a => Derp (Test a) where
    lol [Foo a] = True

flerp :: Derp a => [a] -> [a] -> Equality Bool
flerp a b = bool (lol a && lol b)
