module Evaluation.Example.Group.MonoidAltMatrix2Add where

import Evaluation.Data

instance Monoid a => Monoid (Matrix2 a) where
    mempty  = Matrix2 mempty mempty mempty mempty
    mappend = matrix2Add

matrix2Add :: Monoid a => Matrix2 a -> Matrix2 a -> Matrix2 a
matrix2Add (Matrix2 a1 a2 a3 a4) (Matrix2 b1 b2 b3 b4) =
    Matrix2 (mappend a1 b1) (mappend a2 b2) (mappend a3 b3) (mappend a4 b4)
