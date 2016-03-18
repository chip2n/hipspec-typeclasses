module Evaluation.Data where

-- Natural numbers
data Nat = Zero | Succ Nat

-- 2x2 matrix
data Matrix2 a = Matrix2 a a a a

-- Linked list
data List a = Empty | Cons a (List a)
