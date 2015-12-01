module Law.Show where

import Tip

showsPrecLaw :: Show a => Int -> a -> String -> String -> Equality String
showsPrecLaw d x r s = showsPrec d x r ++ s === showsPrec d x (r ++ s)
