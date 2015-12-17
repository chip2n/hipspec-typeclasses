(declare-datatypes (a)
  ((Magic (sorcery (lol (=> a (=> a Bool)))))))

(declare-datatypes () ((Test (Test))))

(define-fun
  cMagicTestSorcery
    ((dict (Magic Test)) (a Test) (b Test)) Bool
    (match a
      (case Test
        (match b
          (case Test true)))))

(assert-not
  (forall ((dict (Magic a)) (b a))
    ((lol dict) a a)))

(check-sat)
