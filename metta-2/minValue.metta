;; minValue function: 
;; This function recursively finds the minimum value in a given list.
;; - If the list is empty, it returns an error message.
;; - Otherwise, it compares the head of the list with the minimum of the tail 
;;   and returns the smaller of the two.
;; - Base case: If the list has only one element, it returns that element.

(= (minValue $list)
    (if (== $list ())  
        (error "List is empty")  
        (let* 
            (($head (car-atom $list))  
            ($tail (cdr-atom $list))  
            ($minTail (if (== $tail ())  
                         $head
                         (minValue $tail)  
            )))
            (if (< $head $minTail) $head $minTail)  
        )
    )
)

! (minValue (1 2 5 4))  ;; Expected output: 1
! (minValue (9 3 7 12 8))  ;; Expected output: 3
! (minValue (5))  ;; Expected output: 5
! (minValue ())  ;; Expected output: Error "List is empty"


