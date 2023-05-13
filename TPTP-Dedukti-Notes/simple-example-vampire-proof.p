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
  file('simple-example.p',unknown)).
fof(f10,plain,(
  mortal(socrates)),
  inference(resolution,[],[f7,f8])).
fof(f8,plain,(
  man(socrates)),
  inference(cnf_transformation,[],[f2])).
fof(f2,axiom,(
  man(socrates)),
  file('simple-example.p',unknown)).
fof(f7,plain,(
  ( ! [X0] : (~man(X0) | mortal(X0)) )),
  inference(cnf_transformation,[],[f6])).
fof(f6,plain,(
  ! [X0] : (mortal(X0) | ~man(X0))),
  inference(ennf_transformation,[],[f1])).
fof(f1,axiom,(
  ! [X0] : (man(X0) => mortal(X0))),
  file('simple-example.p',unknown)).
