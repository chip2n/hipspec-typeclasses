{-# LANGUAGE FlexibleInstances, UndecidableInstances #-}

module MonoidNatMul where

import Tip
import GroupLike
import NatMul

-- TODO: The op method is renamed in an ugly way...

instance Monoid Nat where
  mempty = identity
  mappend = op
