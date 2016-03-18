module Evaluation.Semiring where

import Tip

class Semiring a where
    zero :: a
    one  :: a
    add  :: a -> a -> a
    mul  :: a -> a -> a

semiringAddAssoc :: Semiring a => a -> a -> a -> Equality a
semiringAddAssoc a b c = add (add a b) c === add a (add b c)

semiringAddComm :: Semiring a => a -> a -> a -> Equality a
semiringAddComm a b c = add a b === add b a

semiringMulAssoc :: Semiring a => a -> a -> a -> Equality a
semiringMulAssoc a b c = mul (mul a b) c === mul a (mul b c)

semiringMulDistLeft :: Semiring a => a -> a -> a -> Equality a
semiringMulDistLeft a b c = mul a (add b c) === add (mul a b) (mul a c)

semiringMulDistRight :: Semiring a => a -> a -> a -> Equality a
semiringMulDistRight a b c = mul (add a b) c === add (mul a c) (mul b c)

semiringAddLeftId :: Semiring a => a -> Equality a
semiringAddLeftId a = add zero a === a

semiringAddRightId :: Semiring a => a -> Equality a
semiringAddRightId a = add a zero === a

semiringMulLeftId :: Semiring a => a -> Equality a
semiringMulLeftId a = mul one a === a

semiringMulRightId :: Semiring a => a -> Equality a
semiringMulRightId a = mul a one === a

semiringMulAnnihLeft :: Semiring a => a -> Equality a
semiringMulAnnihLeft a = mul zero a === zero

semiringMulAnnihRight :: Semiring a => a -> Equality a
semiringMulAnnihRight a = mul a zero === zero
