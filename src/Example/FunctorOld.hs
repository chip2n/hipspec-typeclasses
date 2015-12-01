module Example.OrdOld where

import HipSpec
import Prelude (Bool(..), Ord, Eq, (||), (&&), (.))

data Maybe a = Just a | Nothing
data Test = Low | Middle | High

(==) :: Maybe Test -> Maybe Test -> Bool
Just a  == Just b  = a `testEq` b
Nothing == Nothing = True
_       == _       = False

testEq :: Test -> Test -> Bool
Low    `testEq` Low    = True
Middle `testEq` Middle = True
High   `testEq` High   = True
_      `testEq` _      = False

fmap :: (Test -> Test) -> Maybe Test -> Maybe Test
fmap _ Nothing  = Nothing
fmap f (Just x) = Just (f x)

id :: a -> a
id a = a

functorLaw1 :: Maybe Test -> Prop Bool
functorLaw1 a = proveBool (fmap id a == id a)

functorLaw2 :: Maybe Test -> (Test -> Test) -> (Test -> Test) -> Prop Bool
functorLaw2 a f g = proveBool ((fmap f . fmap g) a == fmap (f . g) a)
