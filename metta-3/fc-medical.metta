;; The purpose of this code is to demonstrate forward chaining with logical inference in a medical context.
;; It uses a knowledge base of medical facts and a rule base that implements the chain rule for deducing conclusions.
;; The code recursively applies logical rules to infer medical conditions and treatments from given facts.

;; It defines:
;; - A cast function to convert numbers to a natural number representation (using S for successor and Z for zero).
;; - A knowledge base that holds medical facts, where conditions lead to other conditions.
;; - A rule base that applies the chain rule (if p → q and q → r, then p → r) to infer new facts.
;; - A forward chaining algorithm that uses the chain rule to recursively derive conclusions from known facts.

;; Knowledge Base: Stores medical facts (e.g., Fever → Flu, Flu → Antiviral, etc.).
;; Rule Base: Contains rules for applying the chain rule to derive conclusions.
;; Forward Chaining: Uses recursive application of rules to infer new facts.


(: fromNumber (-> Number Atom))
(= (fromNumber $n) (if (<= $n 0) Z (S (fromNumber (- $n 1)))))

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

!(bind! &rb (new-space))
!(add-atom &rb (-> (→ $p $q) (→ $q $r) (→ $p $r))) ;; Chain Rule

(= (fc $premise $depth) $premise)

(= (fc $premise1 (S $k))
   (match &rb (-> (→ $premise1 $nextStep) (→ $nextStep $result) (→ $premise1 $result))
               (match &kb (→ $premise1 $nextStep) 
                     (match &kb (→ $nextStep $result)
                        (fc $result $k)
                     )
               )
   )
)

;; Running forward chaining with chain rule only
!(fc Fever (fromNumber 10))        ;; Expected output: [Fever, Antiviral]
!(fc SoreThroat (fromNumber 4))   ;; Expected output: [SoreThroat, Antibiotic]
!(fc Fatigue (fromNumber 4))      ;; Expected output: [Fatigue, IronSupplement]
!(fc HighBP (fromNumber 4))       ;; Expected output: [HighBP, Medication]


