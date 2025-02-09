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


!(bind! &rb (new-space))
!(add-atom &rb (-> (→ $p $q) (→ $q $r) (→ $p $r)))  ;; Chain Rule


(: bc (-> Atom Nat Atom))
(= (bc $conclusion $depth)
   (match &kb $conclusion $conclusion))

(= (bc $conclusion (S $k))
   (match &rb (-> $premise1 $premise2 $conclusion)       
          (let* (($premise1 (bc_bem $premise1 $k))    
                 ($premise2 (bc_bem $premise2 $k)))  
            $conclusion))
)


!(bc (→ $what Antiviral) (fromNumber 4))  ;; Expected: Fever → Flu → Antiviral
!(bc (→ $what Antibiotic) (fromNumber 4))  ;; Expected: SoreThroat → Infection → Antibiotic
!(bc (→ $what IronSupplement) (fromNumber 4))  ;; Expected: Fatigue → Anemia → IronSupplement
!(bc (→ $what Medication) (fromNumber 4))  ;; Expected: HighBP → Hypertension → Medication


