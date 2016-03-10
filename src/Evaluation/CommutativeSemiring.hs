module Evaluation.CommutativeSemiring where

import Tip
import Evaluation.Semiring

class Semiring a => CommutativeSemiring a

commutativeSemiringMulComm :: CommutativeSemiring a => a -> a -> a -> Equality a
commutativeSemiringMulComm a b c = mul a b === mul b a
