;; Graph Rewriting Example
;; ------------------------
;; This program demonstrates basic graph rewriting using node relations.
;; It defines nodes (only-a, only-b, only-c, only-d) and their connections.
;;
;; Rules:
;; - The first set of rules maps specific atoms (a, b, c, d) to their corresponding labels.
;; - Links define relationships between these labeled atoms.
;;
;; Graph Rewriting Rule:
;; - The first match operation searches for a specific cycle:
;;   (only-a → only-b → only-c → only-a)
;; - If found, it removes the link (only-c → only-a).
;; - Then, it introduces new links:
;;   (only-c → only-d) and (only-d → only-a), modifying the structure.
;;
;; Querying:
;; - The second match operation retrieves any link between two elements ($x, $y).
;;
;; Examples:
;; - Initially, the graph is: a → b → c → a
;; - After rewriting, it transforms into: a → b → c → d → a

(= (only-a a) A)
(= (only-b b) B)
(= (only-c c) C)
(= (only-d d) D)

(link (only-a a) (only-b b))
(link (only-b b) (only-c c))
(link (only-c c) (only-a a))

! (match &self (link $x $y)
    (link $x $y)) 
    
! (match &self (, (link (only-a $a) (only-b $b))
                  (link (only-b $b) (only-c $c))
                  (link (only-c $c) (only-a $a)))
    (let* () 
        (do 
            (remove-atom &self (link (only-c $c) (only-a $a)))
        
            (add-atom &self (link (only-c $c) (only-d $d)))
            (add-atom &self (link (only-d $d) (only-a $a)))
        )
    )
)


! (match &self (link $x $y)
    (link $x $y)) 


