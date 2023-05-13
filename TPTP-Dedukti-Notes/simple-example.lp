require open Logic.U.Set Logic.U.Prop Logic.U.Quant Logic.U.Classic;

constant symbol man : El ι → Prop;

constant symbol mortal : El ι → Prop;

constant symbol socrates : El ι;

// fof(all_men_mortal, axiom, ![X]: (man(X) => mortal(X)) ).
constant symbol all_men_mortal : Prfᶜ (∀ᶜ (λ X, man X ⇒ᶜ mortal X));

// fof(socrates_men, axiom, man(socrates)).
constant symbol socrates_men : Prfᶜ (man socrates);

// fof(socrates_mortal, conjecture, mortal(socrates)).
constant symbol socrates_mortal : Prfᶜ (¬ (mortal socrates));
 
