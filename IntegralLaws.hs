module IntegralLaws where

import Tip

quotRemLaw :: Integral a => a -> a -> Equality a
quotRemLaw x y = (x `quot` y) * y + (x `rem` y) === x

divModLaw :: Integral a => a -> a -> Equality a
divModLaw x y = (x `div` y) * y + (x `mod` y) === x
