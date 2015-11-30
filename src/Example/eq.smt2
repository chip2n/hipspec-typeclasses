(declare-datatypes () ((Test (Low) (Middle) (High))))
(define-fun
  tcsTestEqual
    ((x Test) (y Test)) Bool
    (match x
      (case Low
        (match y
          (case default false)
          (case Low true)))
      (case Middle
        (match y
          (case default false)
          (case Middle true)))
      (case High
        (match y
          (case default false)
          (case High true)))))
(assert-not (forall ((a Test)) (tcsTestEqual a a)))
(check-sat)
