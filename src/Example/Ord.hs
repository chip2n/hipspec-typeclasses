{-# LANGUAGE TypeOperators #-}

module Example.Ord where

import Tip

data Test = Low | Middle | High

instance Eq Test where
  Low    == Low    = True
  Low    == Middle = False
  Low    == High   = False
  Middle == Low    = False
  Middle == Middle = True
  Middle == High   = False
  High   == Low    = False
  High   == Middle = False
  High   == High   = True

instance Ord Test where
  Low    <= Low    = True
  Low    <= Middle = True
  Low    <= High   = True
  Middle <= Low    = False
  Middle <= Middle = True
  Middle <= High   = True
  High   <= Low    = False
  High   <= Middle = False
  High   <= High   = True

{-
(<=) :: Test -> Test -> Bool
_      <= High   = True
Low    <= Middle = True
Middle <= Middle = True
Low    <= Low    = True
_      <= _      = False
-}
