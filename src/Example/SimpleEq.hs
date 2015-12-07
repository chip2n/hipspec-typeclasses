module Example.SimpleEq where

--import Prelude hiding ((==))
import Tip

data Test = Test

instance Eq Test where
    Test == Test = True
    Test /= Test = False

--(==) :: Test -> Test -> Bool
--Test == Test = True

--(==) :: Test -> Test -> Bool
--Test == Test = True

law :: Eq a => a -> Equality Bool
law a = bool (a == a)

law2 :: Test -> Equality Bool
law2 b = bool (b == b)







{-



(assert-not
  (par (a)
    (forall ((x (Eq a)) (b a))
      (@ (@ (@ (as equal (=> a (=> a Bool))) x) b) b))))
(check-sat)



(declare-datatypes () ((Test (Test2))))
(define-fun
  equal
    () (=> Test (=> Test Bool))
    (lambda ((x Test))
      (lambda ((y Test))
        (let ((z x))
          (match z
            (case Test2 (let ((x2 y)) (match x2 (case Test2 true)))))))))
(assert-not (forall ((b Test)) (@ (@ equal b) b)))
(check-sat)

-}
