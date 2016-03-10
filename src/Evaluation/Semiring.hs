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

semiringAddId :: Semiring a => a -> Equality a
semiringAddId a = add a zero === a

semiringMulAssoc :: Semiring a => a -> a -> a -> Equality a
semiringMulAssoc a b c = mul (mul a b) c === mul a (mul b c)

semiringMulId :: Semiring a => a -> Equality a
semiringMulId a = mul a one === a

semiringMulDistLeft :: Semiring a => a -> a -> a -> Equality a
semiringMulDistLeft a b c = mul a (add b c) === add (mul a b) (mul a c)

semiringMulDistRight :: Semiring a => a -> a -> a -> Equality a
semiringMulDistRight a b c = mul (add a b) c === add (mul a c) (mul b c)

semiringMulAnnih :: Semiring a => a -> Equality a
semiringMulAnnih a = mul a zero === zero

