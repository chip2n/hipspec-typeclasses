module Evaluation.Examples.Monad.List where

import Evaluation.Data
import Evaluation.Monad
import Prelude hiding (Monad(..))

-- TODO
instance Monad List where
    return a = Cons a Empty
    Empty >>= f       = Empty
    (Cons a as) >>= f = Cons (f a) $ as >>= f
