{-# LANGUAGE TypeOperators #-}

module Law.Monoid where

import Tip

lawLeftIdentity :: Monoid a => a -> Equality a 
lawLeftIdentity m = mempty `mappend` m === m

lawRightIdentity :: Monoid a => a -> Equality a 
lawRightIdentity m = m `mappend` mempty === m

lawAssociativity :: (Monoid a) => a -> a -> a -> Equality a
lawAssociativity l m r = l `mappend` (m `mappend` r) === (l `mappend` m) `mappend` r
