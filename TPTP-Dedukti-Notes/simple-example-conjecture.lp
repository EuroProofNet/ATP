require open Logic.U.Set Logic.U.Prop Logic.U.Quant Logic.U.Classic;

constant symbol man : El ι → Prop;

constant symbol mortal : El ι → Prop;

constant symbol socrates : El ι;

// fof(all_men_mortal, axiom, ![X]: (man(X) => mortal(X)) ).
constant symbol all_men_mortal : Prfᶜ (∀ᶜ (λ X, man X ⇒ᶜ mortal X));

// fof(socrates_men, axiom, man(socrates)).
constant symbol socrates_men : Prfᶜ (man socrates);

// fof(socrates_mortal, conjecture, mortal(socrates)).
/* The conjecture is not declared constant, since we should rewrite it 
   to a proof of it at the end */
symbol socrates_mortal : Prfᶜ (mortal socrates);
 
/* We define a symbol to add the negation of the conjecture 
 in the context of everything we are going to infer */
symbol Prf_with_context (p : Prop) : TYPE ≔
  Prf (¬ (mortal socrates)) → Prfᶜ (p);


