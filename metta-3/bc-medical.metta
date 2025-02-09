;; Purpose: This code uses backward chaining to identify symptoms based on given treatments.
;; It traces the path from a treatment to its possible causes (symptoms).

;; `fromNumber`: Converts numbers to Peano arithmetic form (Z for zero, S for successor).
;; The Knowledge Base (`&kb`) contains medical facts linking symptoms to treatments (e.g., Fever → Flu).
;; The Rule Base (`&rb`) defines the chain rule: if A → B and B → C, then A → C.
;; The Backward Chaining (`bc`) function determines if a conclusion (treatment) can be reached from symptoms.
;; Queries like `(bc (Implies $what Antiviral) (fromNumber 4))` find symptoms leading to Antiviral treatment.
;; The goal is to reason backward from treatments to symptoms, identifying possible causes.
;; This method helps in diagnosing conditions and understanding the relationships between symptoms and treatments.
;; By applying the chain rule, the system finds the required connections between symptoms and treatments.
;; The result is a list of symptoms that correspond to a particular treatment.


(: fromNumber (-> Number Atom))
(= (fromNumber $n) (if (<= $n 0) Z (S (fromNumber (- $n 1)))))


!(bind! &kb (new-space))
!(add-atom &kb (Implies Fever Flu))
!(add-atom &kb (Implies Cough Flu))
!(add-atom &kb (Implies Flu Antiviral))
!(add-atom &kb (Implies Headache Migraine))
!(add-atom &kb (Implies Migraine Painkiller))
!(add-atom &kb (Implies SoreThroat Infection))
!(add-atom &kb (Implies Infection Antibiotic))
!(add-atom &kb (Implies Fatigue Anemia))
!(add-atom &kb (Implies Anemia IronSupplement))
!(add-atom &kb (Implies HighBP Hypertension))
!(add-atom &kb (Implies Hypertension Medication))


!(bind! &rb (new-space))
!(add-atom &rb (-> (Implies $p $q) (Implies $q $r) (Implies $p $r)))  


(: bc (-> Atom Nat Atom))
(= (bc $conclusion $depth)
   (match &kb $conclusion $conclusion))

(= (bc $conclusion (S $k))
   (match &rb (-> $premise1 $premise2 $conclusion)       
          (let* (($premise1 (bc_bem $premise1 $k))    
                 ($premise2 (bc_bem $premise2 $k)))  
            $conclusion))
)


!(bc (Implies $what Antiviral) (fromNumber 4))           ;; Expected: [(Implies Flu Antiviral)]
!(bc (Implies $what Antibiotic) (fromNumber 4))          ;; Expected: [(Implies Infection Antibiotic)]
!(bc (Implies $what IronSupplement) (fromNumber 4))      ;; Expected: [(Implies Anemia IronSupplement)]
!(bc (Implies $what Medication) (fromNumber 4))          ;; Expected: [(Implies Hypertension Medication)]




