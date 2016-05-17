module Evaluation.Data where

-- Natural numbers
data Nat = Zero | Succ Nat

-- 2x2 matrix
data Matrix2 a = Matrix2 a a a a

-- List
data List a = Empty | Cons a (List a)

-- Binary tree
data Tree a = Leaf a | Branch (Tree a) (Tree a)
