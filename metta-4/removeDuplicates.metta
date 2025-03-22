(= (removeDuplicates $expr)
    (if (== $expr ())
        ()
        (let* (($head (car-atom $expr))
                ($tail (removeDuplicates (cdr-atom $expr)))
                )
                
                (if (isMember $head $tail)
                    $tail
                    (cons-atom $head $tail)
                )
        )
    )
)

(= (isMember $elem $lst)
    (if (== $lst ())
        False
        (if (== $elem (car-atom $lst))
            True
            (isMember $elem (cdr-atom $lst))
        )
    )
)

! (removeDuplicates (A B C B A))


