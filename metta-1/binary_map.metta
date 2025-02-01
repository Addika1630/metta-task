; The `binaryMap` function takes three arguments:
; - A binary function `$f` that operates on two inputs.
; - A constant `$const` to be applied to each element of the list.
; - A list `$list` of elements to which the binary function will be applied.
;
; The function iterates over the list, applying `$f` to each element of the list and `$const`.
; The result is a new list where each element is the result of applying the binary function.

(= (binaryMap $f $const $list)
   (if (== $list ())
       () 
       (let*
           (
               ($head (car-atom $list)) 
               ($tail (cdr-atom $list)) 
               ($mapped (binaryMap $f $const $tail)) 
               ($result ($f $head $const)) 
           )
           (cons-atom $result $mapped) 
       )
   )
)

(= (addTwo $x $y)
   (+ $x $y)
)

! (binaryMap addTwo 10 (1 2 3)) ; Output: (11 12 13)


