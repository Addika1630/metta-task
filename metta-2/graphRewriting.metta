(= (only-a a) A)
(= (only-b b) B)
(= (only-c c) C)
(= (only-d d) D)

(link (only-a a) (only-b b))
(link (only-b b) (only-c c))
(link (only-c c) (only-a a))


! (match &self (, (link (only-a $a) (only-b $b))
                  (link (only-b $b) (only-c $c))
                  (link (only-c $c) (only-a $a)))
    (let* () 
        (do (remove-atom &self (link (only-c $c) (only-a $a)))
        
        (add-atom &self (link (only-c c) (only-d d)))
        (add-atom &self (link (only-d d) (only-a a))))
    )
)

! (match &self (link $x $y)
    (link $x $y)) 


