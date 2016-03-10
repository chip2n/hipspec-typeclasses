module Evaluation.Monad where

import Tip
import Prelude hiding (Monad(..))

class Monad m where
    return :: a -> m a
    (>>=)  :: m a -> (a -> m b) -> m b
    --(>=>)  :: (a -> m b) -> (b -> m c) -> (a -> m c)

lawLeftIdentity :: Monad m => a -> (a -> m b) -> Equality (m b)
lawLeftIdentity a f = (return a >>= f) === f a

--lawMonadLeftIdentity :: Monad m => a -> (a -> m b) -> Equality (m b)
--lawMonadLeftIdentity f = (return >=> f) === f

--lawMonadRightIdentity :: Monad m => m a -> Equality (m a)
--lawMonadRightIdentity f = (f >=> return) === f

--lawMonadAssociativity :: Monad m => (a -> m b) -> (b -> m c) -> (c -> m d) -> a -> Equality (m d)
--lawMonadAssociativity f g h a = ((f >=> g) >=> h) a === (f >=> (g >=> h)) a
