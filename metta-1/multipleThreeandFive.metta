; The `func` function computes the sum of all numbers less than a given number `$x` 
; that are divisible by 3 or 5. It uses recursion to iterate through all numbers from `$x - 1` 
; down to 1, adding those numbers that satisfy the divisibility condition.
;
; Parameters:
; - `$x`: A positive integer that serves as the upper limit (exclusive) for the summation.
;
; Logic:
; - If `$x` is less than or equal to 1, return 0 (base case).
; - Otherwise, check if `$x - 1` is divisible by 3 or 5:
;   - If true, add `$x - 1` to the recursive result of `func` on `$x - 1`.
;   - If false, skip `$x - 1` and recursively call `func` on `$x - 1`.
;
; Example:
; - `(func 10)` computes the sum of numbers less than 10 that are divisible by 3 or 5.
;   The numbers are 3, 5, 6, and 9. Their sum is 23.

(= (func $x)
  (if (> $x 1) ; Stop when $x <= 1
    (if (or (== (% (- $x 1) 3) 0) (== (% (- $x 1) 5) 0)) 
        (+ (- $x 1) (func (- $x 1))) ; Add $x - 1 if divisible by 3 or 5
        (func (- $x 1)) ; Otherwise, skip $x - 1
    ) 
    0 
    )
)

! (func 10)


