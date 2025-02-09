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
!(add-atom &rb (-> (Implies $p $q) (Implies $q $r) (Implies $p $r)))  ;; Chain Rule


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




