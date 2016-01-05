(declare-datatypes () ((Test (Foo))))
(declare-datatypes (a)
  ((Magic (Mgc (lol (=> a (=> a Bool)))))))
(define-fun
  (par (z)
    (sorcery
       () (=> (Magic z) (=> z (=> z Bool)))
       (lambda ((x (Magic z))) (match x (case (Mgc x2) x2))))))
(assert-not
  (par (z)
    (forall ((d (Magic z)) (b z))
      (@ (@ (@ (as sorcery (=> (Magic z) (=> z (=> z Bool)))) d) b) b))))
(check-sat)
