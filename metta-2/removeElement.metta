;; Function: removeElement
;; ------------------------
;; This function removes all occurrences of a given element $x from a list $list.
;; It Parallely checks each element and excludes those that match $x.
;;
;; Parameters:
;; - $list: A list of elements.
;; - $x: The element to be removed.
;;
;; Returns:
;; - A new list with all occurrences of $x removed.


(= (removeElement $list $x)
    (if (== $list ())
        ()
        (collapse (let*
            (($head (superpose $list)))
            (if (== $head $x)
                (empty)
                $head 
            )
        ))
    )
)

! (removeElement (1 2 5 4) 4)  ;; Expected output: (1 2 5)
! (removeElement (1 2 5 4 2) 2)  ;; Expected output: (1 5 4)
! (removeElement (3 3 3 3) 3)  ;; Expected output: ()
! (removeElement () 5)  ;; Expected output: ()
! (removeElement (1 2 3) 4)  ;; Expected output: (1 2 3)


