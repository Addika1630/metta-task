
(= (extracter $array $func)
   (if (== $array ())
       () 
       (notEmpty $array)
   )
)


(= (notEmpty $list)
   (collapse 
        (let $x (superpose $list)
            (if (== $x ()) 
                (empty) 
                $x
            )
        ) 
   )
)

! (extracter ((a)(b g)(d e ) ()) notEmpty) 


