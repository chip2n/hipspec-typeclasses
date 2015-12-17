(declare-datatypes () ((Test (Foo))))

(define-fun
  cMagicTestSorcery
    ((a Test) (b Test)) Bool
    (match a
      (case Foo
        (match b
          (case Foo true)))))

(assert-not
  (forall ((a Test))
    (cMagicTestSorcery a a)))

(check-sat)
