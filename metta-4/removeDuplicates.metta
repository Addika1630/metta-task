;; Function to remove duplicate elements from a given list ($list)  
;; - `superpose` ensures all elements are considered individually  
;; - `unique` extracts distinct elements from the list  
;; - `collapse` ensures the final output is a properly structured list  
(= (removeDuplicates $list)
    (collapse (unique (superpose $list)))
)

;; Query to test the removeDuplicates function with a sample list  
;; Expected output: (1 2 3)  
! (removeDuplicates (1 2 3 2))


