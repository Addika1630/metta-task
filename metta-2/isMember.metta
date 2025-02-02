;; This function checks if an element ($x) is a member of a list ($list).
;; It uses the intersection of the element and the list to determine if the element is present.
;; Additionally, it includes a check to handle empty lists.

(= (isMember $list $x)
    (not (or (== $list ())  ;; Check if the list is empty
             (== (collapse (intersection (superpose ($x)) (superpose $list))) ())  
    ))
)

! (isMember (1 2 5 4) 4)   ;; Test case where element 4 is in the list
! (isMember (1 2 5 4) 3)   ;; Test case where element 3 is not in the list
! (isMember () 3)          ;; Test case for an empty list


