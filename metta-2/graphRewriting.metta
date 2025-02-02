(link B C)
(link C A)
(link C E)

! (match &self (, (link $x $y)
                  (link $y $z)
                  (link $z $x))
               (let () (remove-atom &self (link $x $y))
                       (add-atom &self (link $y $x)))
  ) ; [(), (), ()]
! (match &self (link $x $y)
    (link $x $y)) 


    