;; extracter filters non-empty lists from $array using $func.  
;; notEmpty removes empty lists by checking each element.  
;; Uses superpose and collapse to handle nested structures.

(= (extracter $array $func)
   (if (== $array ())
       () 
       ($func $array)
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


