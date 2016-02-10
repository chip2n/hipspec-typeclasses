module Law.Monad where

import Tip

lawLeftIdentity :: Monad m => a -> (a -> m b) -> Equality (m b)
lawLeftIdentity a f = (return a >>= f) === f a

lawRightIdentity :: Monad m => m a -> Equality (m a)
lawRightIdentity m = (m >>= return) === m

lawAssociativity :: Monad m => (a -> m b) -> (b -> m c) -> m a -> Equality (m c)
lawAssociativity f g m = ((m >>= f) >>= g) === (m >>= (\x -> f x >>= g))
