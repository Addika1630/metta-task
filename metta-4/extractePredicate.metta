;; extracter applies the given function ($func) to filter elements in $array.  
;; notEmpty removes empty lists, while isOdd filters out even numbers.  
;; Uses superpose and collapse to process elements effectively. 

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

(= (isOdd $list) 
    
    (collapse 
        (let $x (superpose $list)
            (if (== (% $x 2) 0) 
                (empty) 
                $x
            )
        ) 
   )
)  


! (extracter ((a)(b g)(d e ) ()) notEmpty) 

! (extracter (1 2 3 4 5 6) isOdd)  


