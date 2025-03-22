;; This function, isMember, checks if an element ($x) exists in a list ($list).
;; It first checks if the list is empty; if it is, the element cannot be a member.
;; Then, it uses the intersection of the element and the list, collapsing the result.
;; If the result of the intersection is an empty list, the element is not a member.
;; If the list is non-empty and the element exists in the list, it returns true.


(= (isMember $list $x)
    (not (or (== $list ())  ;; Check if the list is empty
             (== (collapse (intersection (superpose ($x)) (superpose $list))) ())  
    ))
)

! (isMember (1 2 5 4) 4)   ;; Test case where element 4 is in the list
! (isMember (1 2 5 4) 3)   ;; Test case where element 3 is not in the list
! (isMember () 3)          ;; Test case for an empty list

! (isMember (4 2 5 6) 2);gives True
! (isMember (4 2 5 6) 10);gives False


