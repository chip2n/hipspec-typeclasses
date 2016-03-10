module Evaluation.Examples.Monad.List where

import Evaluation.List
import Evaluation.Monad
import Prelude hiding (Monad(..))

instance Monad List where
    return a = Cons a Empty
    Empty >>= f       = Empty
    (Cons a as) >>= f = Cons (f a) $ as >>= f
