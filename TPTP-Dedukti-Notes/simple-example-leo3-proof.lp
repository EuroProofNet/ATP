require open Logic.U.Set Logic.U.Prop Logic.U.Quant Logic.U.Classic Logic.U.Impredicativity Logic.U.Arrow;

symbol = : Π A : Set, El A → El A → Prop;

rule Prf (= $A $x $y) ↪ Π p : El $A → Prop, Prf (p $x) → Prf (p $y);

require open simple-example.simple-example;

// thf(mortal_type, type, mortal: ($i > $o)).
assert ⊢ mortal : El (ι ⤳ o);

// thf(socrates_type, type, socrates: $i).
assert ⊢ socrates : El (ι);

// thf(man_type, type, man: ($i > $o)).
assert ⊢ man : El (ι ⤳ o);


// thf(4,axiom,((man @ socrates)),file('simple-example.tptp',socrates_men)).
symbol {|4|} : Prfᶜ (man socrates) ≔ socrates_men;

// thf(8,plain,((man @ socrates)),inference(defexp_and_simp_and_etaexpand,[status(thm)],[4])).
symbol {|8|} : Prfᶜ (man socrates) ≔ {|4|};

// thf(3,axiom,((! [A:$i]: ((man @ A) => (mortal @ A)))),file('simple-example.tptp',all_men_mortal)).
symbol {|3|} : Prfᶜ (∀ᶜ (λ A : El ι, man A ⇒ᶜ mortal A)) ≔ all_men_mortal;

// thf(6,plain,((! [A:$i]: ((man @ A) => (mortal @ A)))),inference(defexp_and_simp_and_etaexpand,[status(thm)],[3])).
symbol {|6|} : Prfᶜ (∀ᶜ (λ A : El ι, man A ⇒ᶜ mortal A)) ≔ {|3|};

// thf(7,plain,(! [A:$i] : ((~ (man @ A)) | (mortal @ A))),inference(cnf,[status(esa)],[6])).
// thf(9,plain,(! [A:$i] : ((mortal @ A) | ((man @ socrates) != (man @ A)))),inference(paramod_ordered,[status(thm)],[8,7])).
symbol {|9|} : Prfᶜ (∀ᶜ (λ A : El ι, mortal A ∨ᶜ ¬ (= o (man socrates) (man A))));

// thf(10,plain,((mortal @ socrates)),inference(pattern_uni,[status(thm)],[9:[bind(A, $thf(socrates))]])).
// thf(1,conjecture,((mortal @ socrates)),file('simple-example.tptp',socrates_mortal)).
// thf(2,negated_conjecture,((~ (mortal @ socrates))),inference(neg_conjecture,[status(cth)],[1])).
// thf(5,plain,((~ (mortal @ socrates))),inference(defexp_and_simp_and_etaexpand,[status(thm)],[2])).
// thf(11,plain,(($false)),inference(rewrite,[status(thm)],[10,5])).
// thf(12,plain,(($false)),inference(simp,[status(thm)],[11])).
 
