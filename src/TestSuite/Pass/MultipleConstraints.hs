module Example.MultipleConstraints where

import Tip

data Test = Foo

class Magic z where
  sorcery :: z -> z -> Bool

class Witchcraft y where
  boom :: y -> y -> Bool

instance Magic Test where
  sorcery Foo Foo = True

instance Witchcraft Test where
  boom Foo Foo = True

law :: (Magic q, Witchcraft q) => q -> Equality Bool
law b = bool (sorcery b b && boom b b)

--law2 :: Test -> Equality Bool
--law2 c = bool (sorcery c c)




{-
data Test = Foo

cMagicTestSorcery :: Test -> Test -> Bool
cMagicTestSorcery Foo Foo = True

law :: Test -> Equality Bool
law c = bool (cMagicTestSorcery c c)
-}


{-




Function = {  
  func_name = "$csorcery"
  func_tvs = []
  func_args = []
  func_res = [TyCon "Test" []] :=>: ([TyCon "Test" []] :=>: BuiltinType Boolean)
  func_body = Lam [    
      Local {lcl_name = "ds_dW3", lcl_type = TyCon "Test" []}
  ] (Lam [    
      Local {lcl_name = "ds_dW4", lcl_type = TyCon "Test" []}
  ] (Let (Local {lcl_name = "wild_00", lcl_type = TyCon "Test" []})
         (Lcl (Local {lcl_name = "ds_dW3", lcl_type = TyCon "Test" []}))
         (Match (Lcl (Local {lcl_name = "wild_00", lcl_type = TyCon "Test" []})) [    
            Case = {  
              case_pat = ConPat {pat_con = Global {gbl_name = "Foo",
                                                   gbl_type = PolyType {polytype_tvs = [],
                                                                        polytype_args = [],
                                                                        polytype_res = TyCon "Test" []},
                                                   gbl_args = []},
                                 pat_args = []}
              case_rhs = Let (Local {lcl_name = "wild_X4", lcl_type = TyCon "Test" []})
                             (Lcl (Local {lcl_name = "ds_dW4", lcl_type = TyCon "Test" []}))
                             (Match (Lcl (Local {lcl_name = "wild_X4", lcl_type = TyCon "Test" []})) [    
                                Case = {  
                                  case_pat = ConPat {pat_con = Global {gbl_name = "Foo",
                                                                       gbl_type = PolyType {polytype_tvs = [],
                                                                                            polytype_args = [],
                                                                                            polytype_res = TyCon "Test" []},
                                                                       gbl_args = []},
                                                     pat_args = []}
                                  case_rhs = Lit (Bool True) :@: []
                                }
                              ])
            }
          ])
    ))
}



Function = {  
  func_name = "$csorcery"
  func_tvs = []
  func_args = []
  func_res = [TyCon "Test" []] :=>: ([TyCon "Test" []] :=>: BuiltinType Boolean)
  func_body = Lam [    
      Local {lcl_name = "ds_dUV", lcl_type = TyCon "Test" []}
  ] (Lam [    
      Local {lcl_name = "ds_dUW", lcl_type = TyCon "Test" []}
  ] (Let (Local {lcl_name = "wild_00", lcl_type = TyCon "Test" []})
         (Lcl (Local {lcl_name = "ds_dUV", lcl_type = TyCon "Test" []}))
         (Match (Lcl (Local {lcl_name = "wild_00", lcl_type = TyCon "Test" []})) [    
            Case = {  
              case_pat = ConPat {pat_con = Global {gbl_name = "Foo",
                                                   gbl_type = PolyType {polytype_tvs = [],
                                                                        polytype_args = [],
                                                                        polytype_res = TyCon "Test" []},
                                                   gbl_args = []},
                                 pat_args = []}
              case_rhs = Let (Local {lcl_name = "wild_X4", lcl_type = TyCon "Test" []})
                             (Lcl (Local {lcl_name = "ds_dUW", lcl_type = TyCon "Test" []}))
                             (Match (Lcl (Local {lcl_name = "wild_X4", lcl_type = TyCon "Test" []})) [    
                                Case = {  
                                  case_pat = ConPat {pat_con = Global {gbl_name = "Foo",
                                                                       gbl_type = PolyType {polytype_tvs = [],
                                                                                            polytype_args = [],
                                                                                            polytype_res = TyCon "Test" []},
                                                                       gbl_args = []},
                                                     pat_args = []}
                                  case_rhs = Lit (Bool True) :@: []
                                }
                              ])
            }
          ])
    ))
}



-}






{-



Function = {  
  func_name = "law"
  func_tvs = [  
    "a"
  ]
  func_args = []
  func_res = [TyCon "Magic" [TyVar "a"]] :=>: ([TyVar "a"] :=>: TyCon "Equality" [BuiltinType Boolean])
  func_body = Lam [    
      Local {lcl_name = "$dMagic_aXD", lcl_type = TyCon "Magic" [TyVar "a"]}
  ] (Lam [    
      Local {lcl_name = "b", lcl_type = TyVar "a"}
  ] (At :@: [    
      Global = {  
        gbl_name = "bool"
        gbl_type = PolyType = {  
          polytype_tvs = []
          polytype_args = []
          polytype_res = [BuiltinType Boolean] :=>: TyCon "Equality" [BuiltinType Boolean]
        }
        gbl_args = 
      } :@: []
      At :@: [    
          At :@: [    
              At :@: [    
                  Global = {  
                    gbl_name = "sorcery"
                    gbl_type = PolyType = {  
                      polytype_tvs = [  
                        "a"
                      ]
                      polytype_args = []
                      polytype_res = [TyVar "a"] :=>: ([TyVar "a"] :=>: BuiltinType Boolean)
                    }
                    gbl_args = TyVar "a"
                    
                  } :@: []
                  Lcl (Local {lcl_name = "$dMagic_aXD", lcl_type = TyCon "Magic" [TyVar "a"]})
              ]
              Lcl (Local {lcl_name = "b", lcl_type = TyVar "a"})
          ]
          Lcl (Local {lcl_name = "b", lcl_type = TyVar "a"})
      ]
  ]))
}




Function = {  
  func_name = "law"
  func_tvs = []
  func_args = []
  func_res = [TyCon "Test" []] :=>: TyCon "Equality" [BuiltinType Boolean]
  func_body = Lam [    
      Local {lcl_name = "c", lcl_type = TyCon "Test" []}
  ] (At :@: [    
      Global = {  
        gbl_name = "bool"
        gbl_type = PolyType = {  
          polytype_tvs = []
          polytype_args = []
          polytype_res = [BuiltinType Boolean] :=>: TyCon "Equality" [BuiltinType Boolean]
        }
        gbl_args = 
      } :@: []
      At :@: [    
          At :@: [    
              Global = {  
                gbl_name = "$csorcery"
                gbl_type = PolyType = {  
                  polytype_tvs = []
                  polytype_args = []
                  polytype_res = [TyCon "Test" []] :=>: ([TyCon "Test" []] :=>: BuiltinType Boolean)
                }
                gbl_args = 
              } :@: []
              Lcl (Local {lcl_name = "c", lcl_type = TyCon "Test" []})
          ]
          Lcl (Local {lcl_name = "c", lcl_type = TyCon "Test" []})
      ]
  ])
}




-}
