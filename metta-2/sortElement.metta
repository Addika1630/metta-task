; The following code implements a recursive sorting algorithm using a pivot-based approach,
; similar to the QuickSort algorithm. The main steps involve partitioning the list into elements 
; smaller than and greater than the pivot, recursively sorting each partition, and combining the results.
; 
; Functions:
; - (sortList $list): The main sorting function. Takes an unsorted list and returns a sorted list.
; - (lessPivot $pivot $list): Filters elements from the list that are smaller than the pivot.
; - (greaterPivot $pivot $list): Filters elements from the list that are greater than or equal to the pivot.
; - (concatSortedList $first $last): Concatenates two sorted lists into a single sorted list.
; 
; Usage:
; - Call (sortList $list) with a list of numbers to get the sorted version of the list.
; - Example: ! (sortList (5 2 9 1 6)) ; Output: (1 2 5 6 9)

(= (sortList $list)
   (if (== $list ())
       ()
       (let*
           (
               ($pivot (car-atom $list))
               ($tail (cdr-atom $list))
               ($smaller (lessPivot $pivot $tail)) 
               ($greater (greaterPivot $pivot $tail)) 
               ($restGreaterValue (sortList $greater))
               ($restLesttValue (sortList $smaller))
           )
           (concatSortedList $restLesttValue (cons-atom $pivot $restGreaterValue)) 
       )
   )
)

(= (lessPivot $pivot $list)
   (if (== $list ())
       () 
       (collapse (let*
            (($head (superpose $list)))
            (if (< $head $pivot)
                $head 
                (empty)
            )
        ))
   )
)

(= (greaterPivot $pivot $list)
   (if (== $list ())
       () 
       (collapse (let*
            (($head (superpose $list)))
            (if (>= $head $pivot)
                $head 
                (empty)
            )
        ))
   )
)

(= (concatSortedList $first $last)
    (if (== $first ())
        $last
        (let* ( ($head (car-atom $first))
                ($tail (cdr-atom $first))
                ($tailNew (concatSortedList $tail $last)))
            (cons-atom $head $tailNew))
    )
)


! (sortList (5 2 9 1 6))


