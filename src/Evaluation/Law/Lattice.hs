module Law.Lattice where

import Tip
import Lattice

latticeCommAnd :: Lattice a => a -> a -> Equality a
latticeCommAnd a b = a &.& b === b &.& a

latticeCommOr :: Lattice a => a -> a -> Equality a
latticeCommOr a b = a |.| b === b |.| a

latticeAssocAnd :: Lattice a => a -> a -> a -> Equality a
latticeAssocAnd a b c = a &.& (b &.& c) === (a &.& b) &.& c

latticeAssocOr :: Lattice a => a -> a -> a -> Equality a
latticeAssocOr a b c = a |.| (b |.| c) === (a |.| b) |.| c

latticeAbsorbAnd :: Lattice a => a -> a -> Equality a
latticeAbsorbAnd a b = a |.| (a &.& b) === a

latticeAbsorbOr :: Lattice a => a -> a -> Equality a
latticeAbsorbOr a b = a &.& (a |.| b) === a

latticeIdemAnd :: Lattice a => a -> Equality a
latticeIdemAnd a = a |.| a === a

latticeIdemOr :: Lattice a => a -> Equality a
latticeIdemOr a = a &.& a === a

