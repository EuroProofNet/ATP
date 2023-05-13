% Time passed: 701ms (effective reasoning time: 380ms)
% Solved by strategy<name(default),share(1.0),primSubst(3),sos(false),unifierCount(4),uniDepth(8),boolExt(true),choice(true),renaming(true),funcspec(false), domConstr(0),specialInstances(39),restrictUniAttempts(true),termOrdering(CPO)>
% Axioms used in derivation (2): socrates_men, all_men_mortal
% No. of inferences in proof: 12
% SZS status Theorem for simple-example.tptp : 701 ms resp. 380 ms w/o parsing
% SZS output start Refutation for simple-example.tptp
thf(mortal_type, type, mortal: ($i > $o)).
thf(socrates_type, type, socrates: $i).
thf(man_type, type, man: ($i > $o)).
thf(4,axiom,((man @ socrates)),file('simple-example.tptp',socrates_men)).
thf(8,plain,((man @ socrates)),inference(defexp_and_simp_and_etaexpand,[status(thm)],[4])).
thf(3,axiom,((! [A:$i]: ((man @ A) => (mortal @ A)))),file('simple-example.tptp',all_men_mortal)).
thf(6,plain,((! [A:$i]: ((man @ A) => (mortal @ A)))),inference(defexp_and_simp_and_etaexpand,[status(thm)],[3])).
thf(7,plain,(! [A:$i] : ((~ (man @ A)) | (mortal @ A))),inference(cnf,[status(esa)],[6])).
thf(9,plain,(! [A:$i] : ((mortal @ A) | ((man @ socrates) != (man @ A)))),inference(paramod_ordered,[status(thm)],[8,7])).
thf(10,plain,((mortal @ socrates)),inference(pattern_uni,[status(thm)],[9:[bind(A, $thf(socrates))]])).
thf(1,conjecture,((mortal @ socrates)),file('simple-example.tptp',socrates_mortal)).
thf(2,negated_conjecture,((~ (mortal @ socrates))),inference(neg_conjecture,[status(cth)],[1])).
thf(5,plain,((~ (mortal @ socrates))),inference(defexp_and_simp_and_etaexpand,[status(thm)],[2])).
thf(11,plain,(($false)),inference(rewrite,[status(thm)],[10,5])).
thf(12,plain,(($false)),inference(simp,[status(thm)],[11])).
% SZS output end Refutation for simple-example.tptp
