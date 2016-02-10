module Law.Functor where

import Tip

functorLaw1 :: Functor f => f a -> Equality (f a)
functorLaw1 a = fmap id a === id a

functorLaw2 :: Functor f => f a -> (b -> c) -> (a -> b) -> Equality (f c)
functorLaw2 a f g = (fmap f . fmap g) a === fmap (f . g) a
