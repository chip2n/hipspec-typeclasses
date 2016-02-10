module Law.Applicative where

import Tip

applicativeIdentity :: Applicative m => m a -> Equality (m a)
applicativeIdentity v = (pure id <*> v) === v

applicativeComposition :: Applicative m => m (b -> a) -> m (c -> b) -> m c
                       -> Equality (m a)
applicativeComposition u v w = (pure (.) <*> u <*> v <*> w) === (u <*> (v <*> w))

applicativeHomomorphism :: Applicative m => (a -> b) -> a -> Equality (m b)
applicativeHomomorphism f x = (pure f <*> pure x) === pure (f x)

applicativeInterchange :: Applicative m => m (a -> b) -> a -> Equality (m b)
applicativeInterchange u y = (u <*> pure y) === (pure ($ y) <*> u)
