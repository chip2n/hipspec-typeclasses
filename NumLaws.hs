module NumLaws where

import Tip

absSignumLaw :: Num a => a -> a -> Equality a
absSignumLaw x y = abs x * signum x === x
