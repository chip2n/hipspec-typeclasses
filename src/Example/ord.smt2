(declare-datatypes () ((Test (Low) (Middle) (High))))
(define-fun
  testLe
    ((x Test) (y Test)) Bool
    (match y
      (case default
        (match x
          (case Low
            (match y
              (case Low true)
              (case Middle true)
              (case High false)))
          (case Middle
            (match y
              (case default false)
              (case Middle true)))
          (case High false)))
      (case High true)))
(assert-not
  (par (a)
    (forall ((x (Ord a)) (b a) (c a))
      (or (@ (@ (@ (as testLe (=> a (=> a Bool))) x) b) c)
        (@ (@ (@ (as testLe (=> a (=> a Bool))) x) c) b)))))
(check-sat)
