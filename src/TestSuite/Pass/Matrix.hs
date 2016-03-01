module Matrix where

import Tip

data Matrix2 = Matrix2 ((Nat, Nat)
                       ,(Nat, Nat)
                       )

data Nat = Zero | Succ Nat

class Add a where
  add  :: a -> a -> a

instance Add Nat where
  add Zero a = a
  add (Succ a) b = Succ (add a b)

instance Add Matrix2 where
  add a b = matrixAdd2 a b

matrixAdd2 :: Matrix2 -> Matrix2 -> Matrix2
matrixAdd2 (Matrix2 (a,a')) (Matrix2 (b,b')) = Matrix2 (add2 a b, add2 a' b')
  where add2 (x,x') (y,y') = (add x y, add x' y')

semiringAddAssoc :: Add a => a -> a -> a -> Equality a
semiringAddAssoc a b c = add (add a b) c === add a (add b c)

