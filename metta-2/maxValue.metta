;; maxValue function
;; -----------------
;; This function finds the maximum value in a given list.
;; It uses recursion to compare each element with the current maximum.
;; 
;; Parameters:
;; - $list: A list of numerical values.
;;
;; Returns:
;; - The maximum numerical value in the list.
;; - If the list is empty, it returns an error message.
;;
;; Examples:
;; - (maxValue (1 2 5 4))  ;; Returns 5
;; - (maxValue (9 3 7 12 8))  ;; Returns 12
;; - (maxValue (5))  ;; Returns 5
;; - (maxValue ())  ;; Returns Error "List is empty"


(= (maxValue $list)
    (if (== $list ())  
        (error "List is empty")  
        (let* 
            (($head (car-atom $list))  
            ($tail (cdr-atom $list))  
            ($maxTail (if (== $tail ())  
                         $head
                         (maxValue $tail)  
            )))
            (if (> $head $maxTail) $head $maxTail)  
        )
    )
)

! (maxValue (1 2 5 4))  ;; Expected output: 5
! (maxValue (9 3 7 12 8))  ;; Expected output: 12
! (maxValue (5))  ;; Expected output: 5
! (maxValue ())  ;; Expected output: Error "List is empty"

