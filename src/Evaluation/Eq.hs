module Evaluation.Eq where

import Tip
import Prelude hiding (Eq(..))

class Eq a where
    (==) :: a -> a -> Bool
    (/=) :: a -> a -> Bool
