{-# LANGUAGE TypeOperators #-}

module Example.Eq where

import Tip

data Test = Low | Middle | High

instance Eq Test where
    Low    == Low    = True
    Middle == Middle = True
    High   == High   = True
    _      == _      = False

