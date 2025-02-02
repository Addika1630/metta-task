(= (only-a a) A)
(= (only-b b) B)
(= (only-c c) C)
(= (only-d d) D)

(link (only-a a) (only-b b))
(link (only-b b) (only-c c))
(link (only-c c) (only-a a))


;; Now match the links and remove one
! (match &self (, (link $x $y)
                  (link $y $z)
                  (link $z $x))
    (let* () 
        ;; Remove the link (only-c c) -> (only-a a)
        (do (remove-atom &self (link (only-c c) (only-a a)))
        
        ;; Add new links
        (add-atom &self (link (only-c c) (only-d d)))
        (add-atom &self (link (only-d d) (only-a a))))
    )
)

! (match &self (link $x $y)
    (link $x $y)) 


