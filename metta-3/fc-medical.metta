;; Define a function to convert numbers to Peano representation
(: fromNumber (-> Number Atom))
(= (fromNumber $n) (if (<= $n 0) Z (S (fromNumber (- $n 1)))))


;; Extended Medical Knowledge Base
!(bind! &kb (new-space))
!(add-atom &kb (→ Fever Flu))
!(add-atom &kb (→ Cough Flu))
!(add-atom &kb (→ Flu Antiviral))
!(add-atom &kb (→ Headache Migraine))
!(add-atom &kb (→ Migraine Painkiller))
!(add-atom &kb (→ SoreThroat Infection))
!(add-atom &kb (→ Infection Antibiotic))
!(add-atom &kb (→ Fatigue Anemia))
!(add-atom &kb (→ Anemia IronSupplement))
!(add-atom &kb (→ HighBP Hypertension))
!(add-atom &kb (→ Hypertension Medication))
!(add-atom &kb Fever)
!(add-atom &kb Cough)
!(add-atom &kb SoreThroat)
!(add-atom &kb Fatigue)
!(add-atom &kb HighBP)

;; Medical Rule Base
!(bind! &rb (new-space))
!(add-atom &rb (-> (→ $symptom $disease) $symptom $disease))

;; Forward Chaining Inference Engine

;; Base case: If depth is zero, return the premise
(= (fc $premise $Z) $premise)

;; Recursive case: Apply rules and continue inference
(= (fc $premise (S $k))
   (match &rb (-> $premise $nextStep $result)
          (match &kb $nextStep (fc $result $k))))

(= (fc $nextStep (S $k))
   (match &rb (-> $premise $nextStep $result)
          (match &kb $premise (fc $result $k))))

;; Running forward chaining with increased depth
!(fc Fever (fromNumber 4))        ;; Expected output: [Fever, Flu, Antiviral]
!(fc SoreThroat (fromNumber 4))   ;; Expected output: [SoreThroat, Infection, Antibiotic]
!(fc Fatigue (fromNumber 4))      ;; Expected output: [Fatigue, Anemia, IronSupplement]
!(fc HighBP (fromNumber 4))       ;; Expected output: [HighBP, Hypertension, Medication]



