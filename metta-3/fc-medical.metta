;; Define a function to convert numbers to Peano representation
(: fromNumber (-> Number Atom))
(= (fromNumber $n) (if (<= $n 0) Z (S (fromNumber (- $n 1)))))

;; Medical Knowledge Base
!(bind! &kb (new-space))
!(add-atom &kb (→ Fever Flu))
!(add-atom &kb (→ Cough Flu))
!(add-atom &kb (→ Flu Antiviral))
!(add-atom &kb (→ Headache Migraine))
!(add-atom &kb (→ Migraine Painkiller))
!(add-atom &kb Fever)
!(add-atom &kb Cough)

;; Medical Rule Base
!(bind! &rb (new-space))
!(add-atom &rb (-> (→ $symptom $disease) $symptom $disease))
!(add-atom &rb (-> (→ $disease $treatment) $disease $treatment))

;; Forward Chaining Inference Engine

;; Base case: If depth is zero, return the premise
(= (fc $premise Z) $premise)

;; Recursive case: Apply rules and continue inference
(= (fc $premise (S $k))
   (match &rb (-> $premise $nextStep $result)
          (match &kb $nextStep (fc $result $k))))

(= (fc $nextStep (S $k))
   (match &rb (-> $premise $nextStep $result)
          (match &kb $premise (fc $result $k))))

;; Running forward chaining for different symptoms
!(fc Fever (fromNumber 2))    ;; Expected output: (Fever Flu Antiviral)
!(fc Headache (fromNumber 2)) ;; Expected output: (Headache Migraine Painkiller)


