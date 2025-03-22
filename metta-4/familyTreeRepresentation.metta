! (import! &people people_kb)

(= (find-children $x)
   (match &people
     (, (Parent $x $y))
     $y
   )
)

(= (find-grandchildren $x)
   (match &people
     (, (Parent $x $y)
         (Parent $y $z))
     $z
   )
)
! (find-children Bob)

! (find-grandchildren Bob)


