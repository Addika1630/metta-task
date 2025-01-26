; This function calculates the sum of all numbers from 1 to $x that are divisible by 3 or 5,
; but skips the initial value of $x during the evaluation.
; It uses recursion to iterate through each number from $x-1 down to 1.

(= (func $x)
  (if (> $x 1) ; Stop when $x <= 1
    (if (or (== (% (- $x 1) 3) 0) (== (% (- $x 1) 5) 0)) 
        (+ (- $x 1) (func (- $x 1))) ; Add $x - 1 if divisible by 3 or 5
        (func (- $x 1)) ; Otherwise, skip $x - 1
    ) 
    0 ; Base case
    )
)

; Call the function
! (func 10)
