module Example.MultipleInstances where

import Tip

data Foo = Bar

class Magic a where
  fireball :: a -> Bool
  icebolt  :: a -> Bool

class Magic a => Witchcraft a where
  curse :: a -> Bool

instance Magic Foo where
  fireball Bar = True
  icebolt  Bar = False

instance Witchcraft Foo where
  curse a = fireball a && icebolt a

law :: Witchcraft a => a -> Equality Bool
law a = bool (not (curse a))
