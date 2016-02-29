module Maybe where

import Prelude hiding (Maybe(..))
import Control.Monad
import Tip

data Maybe a = Just a | Nothing

instance  Functor Maybe  where
    fmap _ Nothing       = Nothing
    fmap f (Just a)      = Just (f a)

instance Applicative Maybe where
    pure = Just

    Just f  <*> m       = fmap f m
    Nothing <*> _m      = Nothing

    Just _m1 *> m2      = m2
    Nothing  *> _m2     = Nothing

instance  Monad Maybe  where
    (Just x) >>= k      = k x
    Nothing  >>= _      = Nothing

    (>>) = (*>)

    return              = Just
    fail _              = Nothing

-- lawLeftIdentity :: Monad m => a -> (a -> m b) -> Equality (m b)
-- lawLeftIdentity a f = (return a >>= f) === f a
--
-- lawRightIdentity :: Monad m => m a -> Equality (m a)
-- lawRightIdentity m = (m >>= return) === m
--
-- lawAssociativity :: Monad m => (a -> m b) -> (b -> m c) -> m a -> Equality (m c)
-- lawAssociativity f g m = ((m >>= f) >>= g) === (m >>= (\x -> f x >>= g))

lawLeftIdentity :: Monad m => a -> (a -> m b) -> Equality (m b)
lawLeftIdentity a f = (return a >>= f) === f a

lawRightIdentity :: Monad m => m a -> Equality (m a)
lawRightIdentity m = (m >>= return) === m

lawAssociativity :: Monad m => (a -> m b) -> (b -> m c) -> (c -> m d) -> a -> Equality (m d)
lawAssociativity f g h a = ((f >=> g) >=> h) a === (f >=> (g >=> h)) a
