(declare-datatypes (a)
  ((Maybe (Nothing) (Just (unJust a)))))

(define-fun
  (par (a b)
    (fmap
      ((f (=> a b)) (m (Maybe a))) (Maybe b)
        (match m
          (case Nothing (as Nothing (Maybe b)))
          (case (Just a) (Just (@ f a)))))))

(define-fun
  (par (a)
    (id ((x a)) a
      x)))

;(assert-not
;  (par (a)
;    (forall ((m (Maybe a)))
;      (= (as (fmap id m) (Maybe a)) m))))

(check-sat)




; instance Functor Maybe where
;   fmap :: (a -> b) -> Maybe a -> Maybe b
;   fmap _ Nothing  = Nothing
;   fmap f (Just a) = Just (f a)
;
; laws:
;   fmap id = id
;   fmap (p . q) = (fmap p) . (fmap q)
