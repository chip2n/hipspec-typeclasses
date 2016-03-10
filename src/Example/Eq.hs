module Example.Eq where

import Tip

data Test = Foo | Bar

instance Eq Test where
    Foo == Foo = True
    Bar == Bar = True
    _   == _   = False

reflexivityLaw :: Eq a => a -> Equality Bool 
reflexivityLaw a = bool (a == a)
