module Evaluation.Example.Ring.SemiringMat2 where

import Tip
import Evaluation.Data
import Evaluation.Semiring
import Evaluation.Example.Ring.SemiringNat (natAdd, natMul)

-- 2x2 matrix
data Mat2 = Mat2 (Nat,Nat) (Nat,Nat)

instance Semiring Mat2 where
--    zero = Mat2 (zero,zero) (zero,zero)
--    one  = Mat2 (one,zero) (zero,one)
    add  = matrix2Add
    mul  = matrix2Mul

-- 2x2 Matrix addition
matrix2Add :: Mat2 -> Mat2 -> Mat2
matrix2Add (Mat2 (a1,a2) (a3,a4)) (Mat2 (b1,b2) (b3,b4)) =
    Mat2 (natAdd a1 b1, natAdd a2 b2)
            (natAdd a3 b3, natAdd a4 b4)

matrix2Mul :: Mat2 -> Mat2 -> Mat2
matrix2Mul (Mat2 (a1,a2) (a3,a4)) (Mat2 (b1,b2) (b3,b4)) =
    Mat2 (natAdd (natMul a1 b1) (natMul a2 b3), natAdd (natMul a1 b2) (natMul a2 b4))
            (natAdd (natMul a3 b1) (natMul a4 b3), natAdd (natMul a3 b2) (natMul a4 b4))
