module Law.MonadTransformer where

import Tip
import qualified Control.Monad as CM
import qualified Prelude as P

data Maybe a = Just a | Nothing
newtype MaybeT m a = MaybeT { runMaybeT :: m (Maybe a) }

(>>=) :: Maybe a -> (a -> Maybe b) -> Maybe b
(Just x) >>= k   = k x
Nothing  >>= _   = Nothing

return :: a -> Maybe a
return = Just

returnT :: a -> MaybeT Maybe a
returnT = lift P.. return

bindT x f = MaybeT (runMaybeT x >>= (\v -> case v of
                                               Nothing -> return Nothing
                                               Just y -> runMaybeT (f y)))

liftM :: (a -> b) -> Maybe a -> Maybe b
liftM _ Nothing  = Nothing
liftM f (Just x) = Just (f x)

lift :: Maybe a -> MaybeT Maybe a
lift = MaybeT P.. liftM Just

law1 = lift P.. return === returnT
law2 m f = lift (m >>= f) === lift m `bindT` (lift P.. f)
