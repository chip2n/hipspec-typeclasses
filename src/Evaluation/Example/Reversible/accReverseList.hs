module AccReverseList where

import Tip

class Reversible a where
  rev :: a -> a

qrev :: [a] -> [a] -> [a]
qrev acc [] = acc
qrev acc (x:xs) = qrev (x:acc) xs

instance Reversible [a] where
  rev = qrev []

reverseLaw :: Reversible a => a -> Equality a
reverseLaw xs = rev (rev xs) === xs

