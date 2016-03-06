{-# LANGUAGE FlexibleInstances, UndecidableInstances #-}

module GroupLike where

class GroupLike a where
    op :: a -> a -> a

-- TODO: Would be nice to support multiple constraints in these cases
class GroupLike a => GroupLikeWithIdentity a where
    identity :: a

class GroupLike a => Semigroup a

class GroupLikeWithIdentity a => Group a

-- Doesn't work yet
--instance GroupLikeWithIdentity a => Monoid a where
--  mempty  = identity
--  mappend = op
