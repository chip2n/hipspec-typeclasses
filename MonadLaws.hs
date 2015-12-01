module MonadLaws where

import Tip
import qualified Prelude
-- import Prelude (Maybe(..), (>>=), return)

data Maybe a = Just a | Nothing

(>>=) :: Maybe a -> (a -> Maybe b) -> Maybe b
(Just x) >>= k   = k x
Nothing  >>= _   = Nothing

return :: a -> Maybe a
return = Just

lawLeftIdentity :: a -> (a -> Maybe b) -> Equality (Maybe b)
lawLeftIdentity a f    = (return a >>= f) === f a

lawRightIdentity :: Maybe a -> Equality (Maybe a)
lawRightIdentity m     = (m >>= return)   === m

lawAssociativity :: (a -> Maybe b) -> (b -> Maybe c) -> Maybe a -> Equality (Maybe c)
lawAssociativity f g m = ((m >>= f) >>= g) === (m >>= (\x -> f x >>= g))
