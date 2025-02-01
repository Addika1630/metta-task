; This function calculates the sum of all even Fibonacci numbers below a given limit.
; 
; Parameters:
;   - $limit: The maximum value that Fibonacci numbers should not exceed.
;   - $a: The current Fibonacci number in the sequence.
;   - $b: The next Fibonacci number in the sequence.
;   - $sum: The cumulative sum of even Fibonacci numbers encountered so far.
;
; Logic:
;   - If the current Fibonacci number ($a) exceeds the limit ($limit), the function stops and returns the accumulated sum ($sum).
;   - If the current Fibonacci number ($a) is even, it is added to the sum, and the function recurses with the next Fibonacci numbers.
;   - If the current Fibonacci number ($a) is odd, it is skipped, and the function continues with the next Fibonacci numbers without modifying the sum.
;
; Usage:
;   Call the function with initial values for $a, $b, and $sum (e.g., 0, 1, and 0 respectively).
;   Example: ! (sum_even_fibonacci_within_limit 100 0 1 0)
;   This will return 44, the sum of even Fibonacci numbers below 100 (2, 8, 34).

(= (sum_even_fibonacci_within_limit $limit $a $b $sum)
   (if (> $a $limit)
       $sum  
       (if (== (% $a 2) 0)  
           (sum_even_fibonacci_within_limit $limit $b (+ $a $b) (+ $sum $a))  
           (sum_even_fibonacci_within_limit $limit $b (+ $a $b) $sum))))  

! (sum_even_fibonacci_within_limit 100 0 1 0)


