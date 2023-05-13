require open Logic.U.Set Logic.U.Prop Logic.U.Quant Logic.U.Classic;
require open simple-example.simple-example-conjecture;

/* The following should be put in a library */
/* Embedding of clauses */
symbol prop_clause : TYPE;

symbol ec : prop_clause;

symbol ⋅ : Prop → prop_clause → prop_clause; notation ⋅ infix right 1;

symbol clause : TYPE;

symbol cl : prop_clause → clause;
symbol bind [A : Set] : (El A → clause) → clause;

symbol Prf_prop_clause : prop_clause → TYPE;

rule Prf_prop_clause ec ↪ Prf ⊥
with Prf_prop_clause ($p ⋅ $c) ↪ (Prf $p → Prf ⊥) → Prf_prop_clause $c;

symbol Prf_clause : clause → TYPE;

rule Prf_clause (cl $c) ↪ Prf_prop_clause $c
with Prf_clause (bind $f) ↪ Π x, Prf_clause ($f x);

symbol Prfclause_with_context (c : clause) : TYPE ≔
  Prf (¬ (mortal socrates)) → Prf_clause c;


/* Some useful lemmas about propositional logic, 
   to reprove formula transformations */
symbol pnnp (p : Prop) : Prf p → Prf (¬ (¬ p)) ≔ λ pp pnp, pnp pp;

symbol or_introl : Π (p q : Prop), Prf p → Prf (p ∨ q) ≔
λ p q pp r ppr pqr, ppr pp;

symbol or_intror : Π (p q : Prop), Prf q → Prf (p ∨ q) ≔
λ p q pq r ppr pqr, pqr pq;

symbol or_comm : Π (p q : Prop), Prf (p ∨ q) → Prf (q ∨ p) ≔
  λ p q ppvq r pqr ppr, 
  ppvq r ppr pqr;

symbol or_comm_c : Π (p q : Prop), Prfᶜ (p ∨ᶜ q) → Prfᶜ (q ∨ᶜ p) ≔
begin
  assume p q ppvq;
  assume H;
  refine (ppvq _);
  assume H1;
  refine (H _);
  refine (or_comm (¬ ¬ p) (¬ ¬ q) H1);
end;

symbol imp_to_or : Π (p q : Prop), Prfᶜ (p ⇒ᶜ q) → Prfᶜ ((¬ p) ∨ᶜ q) ≔
begin
  assume p q H;
  assume H0;
  refine (H _);
  assume H3;
  refine (H0 (or_introl (¬ ¬ ¬ p) (¬ ¬ q) _));
  assume H4;
  refine (H0 (or_intror (¬ ¬ ¬ p) (¬ ¬ q) _));
  refine (H3 H4);
end;

/* Translation of the TSTP output */

// fof(f1,axiom,(
//   ! [X0] : (man(X0) => mortal(X0))),
//   file('simple-example.p',all_men_mortal)).
symbol f1 : Prf_with_context (∀ᶜ (λ X0, man X0 ⇒ᶜ mortal X0)) ≔
  λ _, all_men_mortal;

// fof(f6,plain,(
//   ! [X0] : (mortal(X0) | ~man(X0))),
//   inference(ennf_transformation,[],[f1])).
symbol f6 : Prf_with_context (∀ᶜ (λ X0, mortal X0 ∨ᶜ ¬ man X0)) ≔
begin
  assume conjecture;
  assume H;
  refine (f1 conjecture _);
  assume H1;
  refine (H _);
  assume X0;
  refine (or_comm_c (¬ man X0) (mortal X0) _);
  refine (imp_to_or (man X0) (mortal X0) (H1 X0));
end;

// fof(f7,plain,(
//   ( ! [X0] : (~man(X0) | mortal(X0)) )),
//   inference(cnf_transformation,[],[f6])).
symbol f7 : Prfclause_with_context (bind (λ X0, cl (¬ man X0 ⋅ mortal X0 ⋅ ec))) ≔
λ conjecture,
λ (X0 : El ι) (l1 : Prf (¬ man X0) → Prf ⊥) (l2 : Prf (mortal X0) → Prf ⊥),
f6 conjecture (λ p : Prf (∀ᶜ (λ X0, mortal X0 ∨ᶜ ¬ (man X0))), 
  p X0 (λ p2 : Prf (mortal X0 ∨ᶜ ¬ (man X0)), 
    p2 ⊥ (pnnp (¬ (mortal X0)) l2) (pnnp (¬ (¬ man X0)) l1)
));

// fof(f2,axiom,(
//   man(socrates)),
//   file('simple-example.p',socrates_men)).
symbol f2 : Prf_with_context (man socrates) ≔
  λ _, socrates_men;

// fof(f8,plain,(
//   man(socrates)),
//   inference(cnf_transformation,[],[f2])).
symbol f8 : Prfclause_with_context (cl (man socrates ⋅ ec)) ≔
  f2;

// fof(f10,plain,(
//   mortal(socrates)),
//   inference(resolution,[],[f7,f8])).
symbol f10 : Prfclause_with_context (cl (mortal socrates ⋅ ec)) ≔
λ conjecture,
λ p : Prf (mortal socrates) → Prf ⊥,
f7 conjecture socrates (λ pnotman, f8 conjecture (λ pman, pnotman pman)) p
;

// fof(f3,conjecture,(
//   mortal(socrates)),
//   file('simple-example.p',socrates_mortal)).
symbol f3 : Prf_with_context (¬ (mortal socrates)) ≔
begin
  assume conjecture;
  assume H;
  refine (H conjecture)
end;

// fof(f4,negated_conjecture,(
//   ~mortal(socrates)),
//   inference(negated_conjecture,[],[f3])).
symbol f4 : Prf_with_context (¬ (mortal socrates)) ≔
  f3;

// fof(f5,plain,(
//   ~mortal(socrates)),
//   inference(flattening,[],[f4])).
symbol f5 : Prf_with_context (¬ (mortal socrates)) ≔
  f4;

// fof(f9,plain,(
//   ~mortal(socrates)),
//   inference(cnf_transformation,[],[f5])).
symbol f9 : Prfclause_with_context (cl (¬ (mortal socrates) ⋅ ec)) ≔
  f5;

// fof(f11,plain,(
//   $false),
//   inference(subsumption_resolution,[],[f10,f9])).
symbol f11 : Prfclause_with_context (cl ec) ≔
λ conjecture,
f9 conjecture (λ pnp, f10 conjecture (λ pp, pnp pp))
;

rule socrates_mortal ↪ f11;
