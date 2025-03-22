;; Function: isMember  
;; ----------------------  
;; This function checks if a given element ($x) exists in a list ($list).  
;;  
;; Logic:  
;; - If the list is empty, return False (the element is not a member).  
;; - Otherwise, extract the first element ($head) and the rest of the list ($tail).  
;; - If $x matches $head, return True (element found).  
;; - If not, recursively check the rest of the list ($tail).  
;;  
;; Test Cases:  
;; - (isMember (1 2 5 4) 4) → True (4 is in the list)  
;; - (isMember (1 2 5 4) 3) → False (3 is not in the list)  
;; - (isMember () 3) → False (empty list)  
;; - (isMember (4 2 5 6) 2) → True  
;; - (isMember (4 2 5 6) 10) → False  

(= (isMember $list $x)
    (if (== $list ()) 
        False
        (let*
            (
                ($head (car-atom $list))
                ($tail (cdr-atom $list))
            )
            (
                if (== $x $head) True (isMember $tail $x)
            )
        )
    )
)


! (isMember (1 2 5 4) 4)   
! (isMember (1 2 5 4) 3)   
! (isMember () 3)          

! (isMember (4 2 5 6) 2);gives True
! (isMember (4 2 5 6) 10);gives False


