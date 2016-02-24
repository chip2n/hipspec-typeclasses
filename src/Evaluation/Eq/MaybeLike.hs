module Maybelike where

data Mebbeh a = Jus a | Nuttin

instance Eq a => Eq (Mebbeh a) where
  (==) Nuttin  Nuttin  = True
  (==) (Jus a) (Jus b) = a == b
  (==) _ _ = False

