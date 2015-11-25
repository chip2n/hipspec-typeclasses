module ReadShowLaws where

import Tip

-- |readsPrec parses the string produced by showsPrec and delivers the value
-- that showsPrec started with.
-- TODO: Possible without Eq instance? Probably not though...
readShowLaw :: (Show a, Read a, Eq a) => Int -> a -> String -> Equality Bool
readShowLaw d x r = (x, "") `elem` readsPrec d (showsPrec d x "") === True
