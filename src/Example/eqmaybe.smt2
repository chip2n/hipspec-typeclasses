(declare-datatypes (a) ((Maybe (Just (Just0 a)) (Nothing))))
(declare-sort Eq 0)
(declare-fun
  Eqfunc
    (Eq Eq) Bool)
(define-fun
  EqMaybefunc
     ((x (Maybe Eq)) (y (Maybe Eq))) Bool
     (match x
       (case (Just c)
         (match y
           (case (Just b2) (Eqfunc c b2))
           (case Nothing false)))
       (case Nothing
         (match y
           (case (Just z) false)
           (case Nothing true)))))
(assert-not
  (forall ((b (Maybe Eq))) (EqMaybefunc b b)))
(assert-not
  (forall ((a (Maybe Eq)) (b (Maybe Eq))) (=> (EqMaybefunc a b) (EqMaybefunc b a))))
(assert-not
  (forall ((a (Maybe Eq)) (b (Maybe Eq)) (c (Maybe Eq)))
    (=> (and (EqMaybefunc a b) (EqMaybefunc b c)) (EqMaybefunc a c))))
(assert (forall ((b Eq)) (Eqfunc b b)))
(check-sat)
