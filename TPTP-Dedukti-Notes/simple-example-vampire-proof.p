% Running in auto input_syntax mode. Trying TPTP
% Refutation found. Thanks to Tanya!
% SZS status Theorem for simple-example
% SZS output start Proof for simple-example
fof(f11,plain,(
  $false),
  inference(subsumption_resolution,[],[f10,f9])).
fof(f9,plain,(
  ~mortal(socrates)),
  inference(cnf_transformation,[],[f5])).
fof(f5,plain,(
  ~mortal(socrates)),
  inference(flattening,[],[f4])).
fof(f4,negated_conjecture,(
  ~mortal(socrates)),
  inference(negated_conjecture,[],[f3])).
fof(f3,conjecture,(
  mortal(socrates)),
  file('simple-example.p',socrates_mortal)).
fof(f10,plain,(
  mortal(socrates)),
  inference(resolution,[],[f7,f8])).
fof(f8,plain,(
  man(socrates)),
  inference(cnf_transformation,[],[f2])).
fof(f2,axiom,(
  man(socrates)),
  file('simple-example.p',socrates_men)).
fof(f7,plain,(
  ( ! [X0] : (~man(X0) | mortal(X0)) )),
  inference(cnf_transformation,[],[f6])).
fof(f6,plain,(
  ! [X0] : (mortal(X0) | ~man(X0))),
  inference(ennf_transformation,[],[f1])).
fof(f1,axiom,(
  ! [X0] : (man(X0) => mortal(X0))),
  file('simple-example.p',all_men_mortal)).
% SZS output end Proof for simple-example
% ------------------------------
% Version: Vampire 4.7 (commit 918277dcd on 2023-03-12 21:19:39 +0100)
% Termination reason: Refutation

% Memory used [KB]: 4861
% Time elapsed: 0.007 s
% ------------------------------
----  Runtime statistics ----
clauses created: 5
-----------------------------
% ------------------------------
