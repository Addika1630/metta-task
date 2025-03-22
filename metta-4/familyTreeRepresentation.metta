;; Import the knowledge base containing people and their relationships  
! (import! &people people_kb)

;; Define a rule to find the children of a given person ($x)  
;; It searches the &people knowledge base for (Parent $x $y) relationships  
;; and returns $y as the child of $x  
(= (find-children $x)
   (match &people
     (, (Parent $x $y))
     $y
   )
)

;; Define a rule to find the grandchildren of a given person ($x)  
;; It searches the &people knowledge base for (Parent $x $y)  
;; and then looks for (Parent $y $z), meaning $z is a grandchild of $x  
(= (find-grandchildren $x)
   (match &people
     (, (Parent $x $y)
         (Parent $y $z))
     $z
   )
)

;; Query to find and print the children of Bob  
! (find-children Bob)

;; Query to find and print the grandchildren of Bob  
! (find-grandchildren Bob)


